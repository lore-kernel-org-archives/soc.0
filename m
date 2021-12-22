Return-Path: <SRS0=nqVE=RH=gmail.com=joel.stan@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB54C433F5
	for <soc@archiver.kernel.org>; Wed, 22 Dec 2021 00:24:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 47045C36AEA; Wed, 22 Dec 2021 00:24:29 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D6DB2C36AE8
	for <soc@kernel.org>; Wed, 22 Dec 2021 00:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D6DB2C36AE8
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id v13so745499pfi.3
        for <soc@kernel.org>; Tue, 21 Dec 2021 16:24:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZnZGwQ79/gV8f3OVEeae75w1s1OLSKvPzKDOMuijlYM=;
        b=btlbKcMYwRni+VRV3An00P0Pg8eTr4udetMGHWkp+TIFOIxG7vuzCGDbnGpPHaQYG6
         4E5vW8oq4oIaSXw76/mKkyhWsAG3i4L8tCakvlybGCI2J5dKolbuGlHZxxGTeYAGktvM
         M5AEa3WOYh1Bf2/73lNLnzbqIjM+baPTOCjRTUE+wTfiyxdLDJDOjunPgFuzcpWoqUh5
         relfzkCH1W6yLPZhcUnhqRtfvow7mb1c026ZWBDEkgnXhubwm1kq2je0qjbyaZdVBmXJ
         YapVSfkEzTwm8ygye/qgYEJJpsM1rezyRozU8sNTEqq8ZuP8CQ6KvAsH8xjwykg1e9sf
         ZuyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=ZnZGwQ79/gV8f3OVEeae75w1s1OLSKvPzKDOMuijlYM=;
        b=ZTEUHfoy2DdwPhOYD0hRsqB9e1HW3u5vej+OpSbhTRNfhT0VXSh3V/Z/mx4NJieFkv
         5rOFvhexQYIBS0YHvQeqLFiduxm/eTkYDMK9ChuwuOBP32i0JN+NS29zyU1ydrP36FWw
         OKZOTUP1tpACYyceaapN16jVNTf6qngJXXSjg8dtBoqotAjvOqgp5kb15MlKInX/YHuV
         Q1HzruS/jxT6K9WzSGzezWv23nPJ/MoxlPhTf4KSvvkB5IbyMKLviqF1DJWf8ML5N1gl
         5KCHb0IxQQQL2qZunI8PI4XNt7RtxdOY5/6vPQa9VtZ/EcHtAkQ7qkKQRLy6NlKoDImv
         kSNA==
X-Gm-Message-State: AOAM531mYXXCzEg3J6GHnZRxUZuknN77Pqo7/KFeBgfOW/OTu8OpN40O
	7USN+xDj3sOFKR1/7ny8fjZ6BZPcAlI=
X-Google-Smtp-Source: ABdhPJwE8j5vSseszbdJK6KoSfpfWlmTtMNGUN2v16rDFn+5EQAW3NyhqOrCfdk5qXR39i6P1lSrzg==
X-Received: by 2002:a05:6a00:2134:b0:4b0:bf74:a64d with SMTP id n20-20020a056a00213400b004b0bf74a64dmr523043pfj.56.1640132666792;
        Tue, 21 Dec 2021 16:24:26 -0800 (PST)
Received: from voyager.lan ([45.124.203.19])
        by smtp.gmail.com with ESMTPSA id a11sm186329pgd.87.2021.12.21.16.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Dec 2021 16:24:25 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From: Joel Stanley <joel@jms.id.au>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Adriana Kobylak <anoo@us.ibm.com>
Subject: [PATCH] ARM: configs: aspeed: Add support for USB flash drives
Date: Wed, 22 Dec 2021 10:54:06 +1030
Message-Id: <20211222002406.119082-1-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Adriana Kobylak <anoo@us.ibm.com>

Add support to detect USB flash drives and create the /dev/sd* devices.
Also add support for vfat to support USB drives formatted as FAT32.
This support will be used to enable firmware updates via USB flash
drives where the firmware image is stored in the USB drive and it's
plugged into the BMC USB port.

Signed-off-by: Adriana Kobylak <anoo@us.ibm.com>
Tested-by: Adriana Kobylak <anoo@us.ibm.com>
Link: https://lore.kernel.org/r/20211112202931.2379145-1-anoo@linux.ibm.com
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
Please apply for v5.17

 arch/arm/configs/aspeed_g5_defconfig | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/configs/aspeed_g5_defconfig b/arch/arm/configs/aspeed_g5_defconfig
index ae4f3c56ae6b..9328145dc0c4 100644
--- a/arch/arm/configs/aspeed_g5_defconfig
+++ b/arch/arm/configs/aspeed_g5_defconfig
@@ -70,6 +70,7 @@ CONFIG_NET_NCSI=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 # CONFIG_PREVENT_FIRMWARE_BUILD is not set
+CONFIG_FIRMWARE_MEMMAP=y
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_PARTITIONED_MASTER=y
@@ -83,6 +84,8 @@ CONFIG_BLK_DEV_LOOP=y
 CONFIG_BLK_DEV_NBD=y
 CONFIG_EEPROM_AT24=y
 CONFIG_EEPROM_AT25=y
+CONFIG_SCSI=y
+CONFIG_BLK_DEV_SD=y
 CONFIG_NETDEVICES=y
 CONFIG_NETCONSOLE=y
 # CONFIG_NET_VENDOR_ALACRITECH is not set
@@ -200,6 +203,7 @@ CONFIG_USB_DYNAMIC_MINORS=y
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_ROOT_HUB_TT=y
 CONFIG_USB_EHCI_HCD_PLATFORM=y
+CONFIG_USB_STORAGE=y
 CONFIG_USB_GADGET=y
 CONFIG_USB_ASPEED_VHUB=y
 CONFIG_USB_CONFIGFS=y
@@ -246,6 +250,7 @@ CONFIG_FSI_OCC=y
 CONFIG_EXT4_FS=y
 CONFIG_FANOTIFY=y
 CONFIG_OVERLAY_FS=y
+CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 CONFIG_JFFS2_FS=y
 # CONFIG_JFFS2_FS_WRITEBUFFER is not set
@@ -261,6 +266,8 @@ CONFIG_PSTORE_PMSG=y
 CONFIG_PSTORE_FTRACE=y
 CONFIG_PSTORE_RAM=y
 # CONFIG_NETWORK_FILESYSTEMS is not set
+CONFIG_NLS_CODEPAGE_437=y
+CONFIG_NLS_ISO8859_1=y
 CONFIG_HARDENED_USERCOPY=y
 CONFIG_FORTIFY_SOURCE=y
 CONFIG_CRYPTO_HMAC=y
-- 
2.34.1

