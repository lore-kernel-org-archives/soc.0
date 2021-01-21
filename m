Return-Path: <SRS0=2LUn=GY=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F87C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 20:35:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B678623A58
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Jan 2021 20:34:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B678623A58
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zh3yA2KYw7ZW/ntJlZhPiwpVY6xcr3+sGd1O/DKD44w=; b=Up775QNJQE5eIsRsLPnPfqKM8n
	JeGFozsnPbBkisuMkvHTH4RNp02Evb1Le3VkPHTvG3uf/2p9HSrsoREC6gy5M0/8QIRHMZnjE6krx
	v/BL1gBAw6srH34MDL5oHjfQGY266lKFhrrtzk5X6WY02/w1jaYY5qq23gxfBmt6XGEKITcsmXdVS
	pEnepb9eBdUc1Rp/dM4BXIVzxdQJw209ZszQqC8My36v9LReh3yH4NgeHq0Ms+DaZoKk0ljksak5I
	XfDexDnMhOJOUYGwkGhy/t8goSiJ9zbYX1pdWb/16qaL0vjnA8VgsmvwJw7GDSH8becuZpIDhCRdT
	uth0nidg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2gdk-00050h-GB; Thu, 21 Jan 2021 20:33:12 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2gdg-0004zw-Ki
 for linux-arm-kernel@lists.infradead.org; Thu, 21 Jan 2021 20:33:09 +0000
Received: by mail-pl1-x62b.google.com with SMTP id s15so1937714plr.9
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 21 Jan 2021 12:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RhTIj+lZ0U9Y9dF9HBJCT1hiEYvd3Uh23ercbE0Xjo0=;
 b=oE65Bo7C917+XskX8Pp4BR0rgNBGq0OHyMlohwEVBhL7BlMY/RovX6x5bv4nsrQKR+
 NafNFj3VcTr+nuVQ2IZlVJnn5YzOXoMSk4wFInhwn9w6gdodwrtDvL4E+CKvppAW5lZT
 ys2NFFCsvRGcjS+NNrLaHiKc5M5ihMxwgNDoblc0og81cxsR8/D/cUqjot6M3gCeVGRw
 U0qujxCGfw4xbqsJP9DRBSydnJjkiTPK1TVFo0l32b8Meet3WwZoRbwwOqS2Cp63MOwk
 5fswfFkHPViDiLZvE9KocBb11cgFCa6i7T7CxmeibDdKZcV8RAMcnydsMkl4jGasNfSD
 J4vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RhTIj+lZ0U9Y9dF9HBJCT1hiEYvd3Uh23ercbE0Xjo0=;
 b=DKpeSFERHPoDIDkImqRpjsNC549BVHi7rv5Ms4zCGgEuiMmmJhU7yITKREWvz0eBxv
 M44gfc0hVL2l2jCaNSKk5xttwfQSifwvBKQaBNELrTTTzjFjhl7Dfawd/s4dm+PxXEHV
 HQ6O7RpTR08VKzC7e1CGCi2sa+FEl+1kz3cq8hrxa+GmvG5UKHIDgBJwNaoh2EyhLVXZ
 UTyuJpUQBf8W7Zx4NXAA4wTFXeIJMGdnSEZsIulo1zy9t1g5WBhDztFuRPSBWITJ9CwY
 ZGECtaiZl8Vvl/XT47ELdKmVyV7iENMJJaGZdkvxDyJPn1C3hHjNVc+Ll7hMmLX00HkF
 s0Ig==
X-Gm-Message-State: AOAM532k8TOVAoVQvRW1vcw0SORcmZdRQqllmSB84XPwShYFLnk3a/2o
 Pk6aDvk07uWhSyGroQmDYQM=
X-Google-Smtp-Source: ABdhPJxlpobMVpdkg95ov70WGAWklTsqgkos4FjFcvwxNJyscXkKc253ymA8WNP8+5as+yuKyYxrlQ==
X-Received: by 2002:a17:90a:9318:: with SMTP id
 p24mr1304995pjo.123.1611261186191; 
 Thu, 21 Jan 2021 12:33:06 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id q12sm6305667pgj.24.2021.01.21.12.33.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 12:33:05 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [GIT PULL 1/2] Broadcom devicetree-arm64 fixes for 5.11
Date: Thu, 21 Jan 2021 12:33:00 -0800
Message-ID: <20210121203302.3639841-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_153308_889627_C6F0F531 
X-CRM114-Status: UNSURE (   9.06  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Bharat Gooty <bharat.gooty@broadcom.com>, Arnd Bergmann <arnd@arndb.de>,
 khilman@kernel.org, Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
 Ray Jui <ray.jui@broadcom.com>, olof@lixom.net,
 bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210121203300.i81LO7Zje9RZCp5G49MHEkigz1djiI3YKNbaqVRa0G4@z>

The following changes since commit 19c329f6808995b142b3966301f217c831e7cf31:

  Linux 5.11-rc4 (2021-01-17 16:37:05 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.11/devicetree-arm64-fixes

for you to fetch changes up to d68aecc153ea4bd55ff32f083f05e9bc5610ec78:

  arm64: dts: broadcom: Fix USB DMA address translation for Stingray (2021-01-20 10:45:56 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM64 SoC fixes for 5.11, please
pull the following:

- Bharat fixes the Stingray USB controllers ability to DMA by providing
  an appropriate 'dma-ranges' property for the interconnect

----------------------------------------------------------------
Bharat Gooty (1):
      arm64: dts: broadcom: Fix USB DMA address translation for Stingray

 arch/arm64/boot/dts/broadcom/stingray/stingray-usb.dtsi | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
