Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A508F12C54B
	for <soc@lists.linux.dev>; Mon, 11 Nov 2024 09:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731318842; cv=none; b=HXbmLSMjwgNr2HNYonEa62qRuBfKBbY+s1xBNwIwD16GpBYYHw9Xk9fL2hm9f+FAsOJW3rVxAmQV6v1Lpw4/IiI5FE7Jh2JQHTZjjTDxhJKHCc2GtThu3313CuwqOaGJyrA3zGg507MoxRavFUEMAr+mwEB5pbNm6XXk1puitAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731318842; c=relaxed/simple;
	bh=Yks4ge+rwDjiskVZgYt7FsPDb2TSXpo5E1jHMPRbquY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=V6wa/CNPQU+AwkSsFiMIYk2GcXRSu4tCAc3foAo7KgPiCd1nvuv3yb1/y0iioHhZoUUUqe6enoWog2/CM2X1H6Ckd3yHtAcF++lDG1Yoi7Lna9MQcKMCBqauy5hfmy3JyW0SK8ezbGBUtu0yr/6DE50jw9sWnALRgWDAyA6mzEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LBx9wwWR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LBx9wwWR"
Received: by smtp.kernel.org (Postfix)
	id 46DDBC4CED6; Mon, 11 Nov 2024 09:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D65C4CED0;
	Mon, 11 Nov 2024 09:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731318842;
	bh=Yks4ge+rwDjiskVZgYt7FsPDb2TSXpo5E1jHMPRbquY=;
	h=From:To:Cc:Subject:Date:From;
	b=LBx9wwWR0U5NXiF7ZSsu9kZFce8BQMszcvbkrCeQtma3QM9knqv60YzdIyNTP0/wh
	 xRoW0g+oQf/alHaj87O9zQqXOFbqyC3vIduiA33GQi1Yucxny0R/WWh+vme32s1O3u
	 SfO/2+kxXQvhXh+g7iTV01MAMbEACJCF5oxVpBqbnVO4kfgdltZyBTlk1R9XPQfDRG
	 mUGjERQYkla50hUwgN+9R2AiQs+DpJfG6hpC2HBChUrw/rLpslmjRXZkeqp386Dfov
	 w9dWzCWtakP8HZ1pGHtJdMEWzM3UnyVHr94EzFEH8ySmNqS2gT/bia2k3oU+y5vU54
	 nEYokZBmlLj5g==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Gregory CLEMENT <gregory.clement@bootlin.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH] firmware: turris-mox-rwtm: Document the driver private data structure
Date: Mon, 11 Nov 2024 10:53:57 +0100
Message-ID: <20241111095357.31932-1-kabel@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add more comprehensive documentation for the driver private data
structure, `struct mox_rwtm`.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/firmware/turris-mox-rwtm.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/turris-mox-rwtm.c b/drivers/firmware/turris-mox-rwtm.c
index f3bc0d427825..47fe6261f5a3 100644
--- a/drivers/firmware/turris-mox-rwtm.c
+++ b/drivers/firmware/turris-mox-rwtm.c
@@ -61,6 +61,27 @@ enum mbox_cmd {
 	MBOX_CMD_OTP_WRITE	= 8,
 };
 
+/**
+ * struct mox_rwtm - driver private data structure
+ * @mbox_client:	rWTM mailbox client
+ * @mbox:		rWTM mailbox channel
+ * @hwrng:		RNG driver structure
+ * @reply:		last mailbox reply, filled in receive callback
+ * @buf:		DMA buffer
+ * @buf_phys:		physical address of the DMA buffer
+ * @busy:		mutex to protect mailbox command execution
+ * @cmd_done:		command done completion
+ * @has_board_info:	whether board information is present
+ * @serial_number:	serial number of the device
+ * @board_version:	board version / revision of the device
+ * @ram_size:		RAM size of the device
+ * @mac_address1:	first MAC address of the device
+ * @mac_address2:	second MAC address of the device
+ * @has_pubkey:		whether board ECDSA public key is present
+ * @pubkey:		board ECDSA public key
+ * @last_sig:		last ECDSA signature generated with board ECDSA private key
+ * @last_sig_done:	whether the last ECDSA signing is complete
+ */
 struct mox_rwtm {
 	struct mbox_client mbox_client;
 	struct mbox_chan *mbox;
@@ -74,13 +95,11 @@ struct mox_rwtm {
 	struct mutex busy;
 	struct completion cmd_done;
 
-	/* board information */
 	bool has_board_info;
 	u64 serial_number;
 	int board_version, ram_size;
 	u8 mac_address1[ETH_ALEN], mac_address2[ETH_ALEN];
 
-	/* public key burned in eFuse */
 	bool has_pubkey;
 	u8 pubkey[135];
 
-- 
2.45.2

