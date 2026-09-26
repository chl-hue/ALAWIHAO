<?php
session_start();
include '../db_connect.php';

// Security: Check if logged in and is Super Admin
if (!isset($_SESSION['role']) || $_SESSION['role'] !== 'Super Admin') {
    die("Unauthorized access.");
}

// Ensure we have the ID, Type, and the confirmation password (POST na, hindi GET,
// para hindi lumabas ang password sa URL/browser history/server logs)
if (isset($_POST['id']) && isset($_POST['type']) && isset($_POST['confirm_password'])) {
    $id = intval($_POST['id']);       // Securely convert ID to integer
    $type = $_POST['type'];           // 'Admin' or 'Worker'
    $confirm_password = trim($_POST['confirm_password']);

    // --- VERIFY THE CURRENTLY LOGGED-IN SUPER ADMIN'S PASSWORD FIRST ---
    if (!isset($_SESSION['user_id'])) {
        header("Location: admin_health_workers.php?error=" . urlencode("Session expired. Please log in again."));
        exit();
    }

    $current_id = $_SESSION['user_id'];
    $stmt = $conn->prepare("SELECT password FROM users WHERE id = ?");
    $stmt->bind_param("i", $current_id);
    $stmt->execute();
    $stmt->bind_result($stored_password);
    $stmt->fetch();
    $stmt->close();

    $password_matches = false;
    if (is_string($stored_password) && $stored_password !== '') {
        $password_matches = password_verify($confirm_password, $stored_password)
            || hash_equals($stored_password, $confirm_password)
            || hash_equals(trim($stored_password), $confirm_password);
    }

    if (!$password_matches) {
        header("Location: admin_health_workers.php?error=" . urlencode("Incorrect password. Deletion cancelled."));
        exit();
    }

    // --- PASSWORD CONFIRMED: PROCEED WITH DELETE ---
    // The directory passes a users.id, so find its email before removing the linked worker row.
    $target_stmt = $conn->prepare("SELECT email FROM users WHERE id = ? LIMIT 1");
    $target_stmt->bind_param("i", $id);
    $target_stmt->execute();
    $target_stmt->bind_result($target_email);
    $target_stmt->fetch();
    $target_stmt->close();

    if (!empty($target_email)) {
        $worker_stmt = $conn->prepare("DELETE FROM health_workers WHERE email = ?");
        $worker_stmt->bind_param("s", $target_email);
        $worker_stmt->execute();
        $worker_stmt->close();
    }

    $del_stmt = $conn->prepare("DELETE FROM users WHERE id = ?");
    if (!$del_stmt) {
        header("Location: admin_health_workers.php?error=" . urlencode("Unable to prepare deletion."));
        exit();
    }

    $del_stmt->bind_param("i", $id);
    $deleted = $del_stmt->execute();
    $del_stmt->close();

    if (!$deleted) {
        header("Location: admin_health_workers.php?error=" . urlencode("Unable to delete personnel account."));
        exit();
    }

    header("Location: admin_health_workers.php?msg=" . urlencode("Personnel deleted successfully."));
    exit();
} else {
    header("Location: admin_health_workers.php?error=" . urlencode("Missing required data."));
    exit();
}
?>