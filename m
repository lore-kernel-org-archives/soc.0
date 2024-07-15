Return-Path: <kabel@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1829C3DA5E
	for <soc@archiver.kernel.org>; Mon, 15 Jul 2024 11:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id E4058C4AF0E; Mon, 15 Jul 2024 11:59:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62CD3C4AF0B;
	Mon, 15 Jul 2024 11:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721044760;
	bh=b/RMi8pE1O8XodlWSP/qHTIDmSEE5TbkZW23gWQrxh4=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WJrZdxvMHZgLmhYHGs60jVqTkYmC+ga3gxmwpyZ5IDhTML6agzK5CMrTsfsD3rKoi
	 bUjXpmYt/tBLjKTwAnoSBEL9vmWppaUNY8IXPH9a/6faYAwi+qKK/sVkyVX1bjeDgi
	 bB4nlat9bph5KW7qhZG5teHaYNKy0PX7Mt1o93hrkMFUnxfI/TX95BAQhucWNv0oNO
	 BEvav6hqkQBspjqKdU+3qwUJYLuQ5ePAqEG8QyIi+CInW4fPoZDfpC3UXnbFcTBFzy
	 jxuYV7hgBaVAqZup6eUmyx5+IzrlHnAZUnSLwQSRFJ1nHCmRefOfIg5zpRJpj1KUOP
	 mkxiWUaTnTMwg==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	arm@kernel.org
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Subject: [PATCH 2/3] firmware: turris-mox-rwtm: Fix checking return value of wait_for_completion_timeout()
Date: Mon, 15 Jul 2024 13:59:11 +0200
Message-ID: <20240715115912.9507-3-kabel@kernel.org>
X-Mailer: git-send-email 2.44.2
In-Reply-To: <20240715115912.9507-1-kabel@kernel.org>
References: <20240715115912.9507-1-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The wait_for_completion_timeout() function returns 0 if timed out, and a
positive value if completed. Fix the usage of this function.

Fixes: 389711b37493 ("firmware: Add Turris Mox rWTM firmware driver")
Fixes: 2eab59cf0d20 ("firmware: turris-mox-rwtm: fail probing when firmware does not support hwrng")
Signed-off-by: Marek Behún <kabel@kernel.org>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index f1f9160c4195..3f4758e03c81 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -202,9 +202,8 @@ static int mox_get_board_info(struct mox_rwtm *rwtm)
 	if (ret < 0)
 		return ret;
 
-	ret = wait_for_completion_timeout(&rwtm->cmd_done, HZ / 2);
-	if (ret < 0)
-		return ret;
+	if (!wait_for_completion_timeout(&rwtm->cmd_done, HZ / 2))
+		return -ETIMEDOUT;
 
 	ret = mox_get_status(MBOX_CMD_BOARD_INFO, reply->retval);
 	if (ret == -ENODATA) {
@@ -238,9 +237,8 @@ static int mox_get_board_info(struct mox_rwtm *rwtm)
 	if (ret < 0)
 		return ret;
 
-	ret = wait_for_completion_timeout(&rwtm->cmd_done, HZ / 2);
-	if (ret < 0)
-		return ret;
+	if (!wait_for_completion_timeout(&rwtm->cmd_done, HZ / 2))
+		return -ETIMEDOUT;
 
 	ret = mox_get_status(MBOX_CMD_ECDSA_PUB_KEY, reply->retval);
 	if (ret == -ENODATA) {
@@ -277,9 +275,8 @@ static int check_get_random_support(struct mox_rwtm *rwtm)
 	if (ret < 0)
 		return ret;
 
-	ret = wait_for_completion_timeout(&rwtm->cmd_done, HZ / 2);
-	if (ret < 0)
-		return ret;
+	if (!wait_for_completion_timeout(&rwtm->cmd_done, HZ / 2))
+		return -ETIMEDOUT;
 
 	return mox_get_status(MBOX_CMD_GET_RANDOM, rwtm->reply.retval);
 }
-- 
2.44.2

