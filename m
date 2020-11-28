Return-Path: <SRS0=CKL9=FC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E59EC63777
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2020 16:36:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21C78246CC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Nov 2020 16:36:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NdHv3zIT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ux08/Km4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21C78246CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=a4+uGSGW5N1bcotdtkQS9MT/cO98CyQDbr4OeTF/4t0=; b=NdHv3zIT7ziEIICnKtLhzePx0
	/l8TeKXMrq1BH14vIoteaipIrInkRnzaRVFe7vnBhwnG1BspGxypc9ejqDdo0pmzLCB3ckZVdVIaW
	lMa+hsbwQT5pqlU7AJMj31V298Mf8MUxuZ7TcwBPO7Q19LH5WiXeJEDvu91E6WexzjDyePyJWUtpf
	D4D2nR6AttJ3AypIG859WLAKkeubFOXa/7d4pmWUidLfRslVVNOmpgs+W7gRfHGrly4GTDUv0SU92
	P3IkOFgXAyRhIFz19SyVaNdqt3DcPgRWZLMByyP617fb53nUKiC46ajD84xDTxLz6ONKyoWP33q5N
	zL+GoPelw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kj3BP-0002I2-35; Sat, 28 Nov 2020 16:34:47 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kj3Ay-00027w-2z
 for linux-arm-kernel@lists.infradead.org; Sat, 28 Nov 2020 16:34:21 +0000
Received: by mail-pg1-x533.google.com with SMTP id t21so6783474pgl.3
 for <linux-arm-kernel@lists.infradead.org>;
 Sat, 28 Nov 2020 08:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=emaTbDYD/JJjwuMKFVHHIeJ3kVna3RHAuUtfrRX8E4I=;
 b=ux08/Km4JMSvH0WPX0hg9KNScuEZ4DQ8NT9D0M5MXoWjD1X+7ngycVg3RPUQ6E5h1s
 pLyHlDKLkcephlCo7iKu3M69GwoJ6OxcEWBp9ZqTZkCbQRJbHDkuvUpRD997CeilPX0S
 BAr+RmoJdJ4PZzYzDD1NlwtzFEEfsu1NtkM9XomTLzQx+80HcDAUBpUAGE0dC/8mTq1c
 HwF+l72wOt4onEuBeHbxVqzlAS23wtOOccwlskNZVYMsluErNplsy5Q3R1LdH21a+SjO
 0+JWYSuI7LPa9R2g+47Ic0MVHhaDM2boIWKq+qdthUmXCF7qFLrb6TOqNaLrSi2aHYov
 WsTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=emaTbDYD/JJjwuMKFVHHIeJ3kVna3RHAuUtfrRX8E4I=;
 b=M3W2tNnpmMJedoVJArnaNpILGHK3CX/sswJlrSpN4LgKTY7Knuw+oyz3M6jk0zf7U0
 fAbnSuzcNpyNne+OtfcIwVBTeW8dBTX8BMZpSI3PyYBi8649YqDICvrRcHXVyAdiowLG
 ZR1IMqpOoZdq7Tevb1+ODSnGeARyH/9EBFjcvG+9ljTRX1zP3R7Rhs/vZb1nh2MyQCP+
 EiHmhRMI1O7/10bLrXPKK5cN1sjcYhV3Wn/nv658+jaEy9BoeDaF9MLnqwySQtuDSvhi
 B+FiVgj7VdIIx3hUad2LKoucFUDQP1z0sV05Afk/iH1EDvFI9z+3pcaFd+QhJ9V6EPNL
 Dxag==
X-Gm-Message-State: AOAM533uXa5tLF99rxw4uBHAMjOjRq1pX2pyh6xmmnTErR9n5pzZzvFk
 BZvteuKJBC3bchjKI4jOBEE=
X-Google-Smtp-Source: ABdhPJxJ435GLXBA8UpRLaO8kPw/CciZV0JSPeJi9WU13MSzOWqOadmtKc8UedI/g25j6Qwx1tb5vg==
X-Received: by 2002:a63:1505:: with SMTP id v5mr11155365pgl.434.1606581257876; 
 Sat, 28 Nov 2020 08:34:17 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id c3sm10909209pfn.67.2020.11.28.08.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 08:34:17 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [GIT PULL 2/5] Broadcom defconfig-arm64 changes for 5.11
Date: Sat, 28 Nov 2020 08:34:07 -0800
Message-ID: <20201128163410.1691529-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201128163410.1691529-1-f.fainelli@gmail.com>
References: <20201128163410.1691529-1-f.fainelli@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201128_113420_187066_B2A81CA7 
X-CRM114-Status: UNSURE (   9.92  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, arnd@arndb.de, khilman@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, Sudeep Holla <sudeep.holla@arm.com>,
 olof@lixom.net, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201128163407.ZQ40e5t39XMgJSEU8anEKrEpRtL3BjFWI0NMdHqFxSs@z>

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.11/defconfig-arm64

for you to fetch changes up to 6a7dc2b3639adc7f9ff5c148aeaef0ee775f6c3a:

  arm64: defconfig: Enable ARM SCMI protocol and drivers (2020-11-27 20:52:00 -0800)

----------------------------------------------------------------
This pull request contains ARM64 defconfig changes for 5.11, please pull
the following:

- Florian enables the ARM SCMI protocol, and the common clock, HWMON and
  CPU frequency scaling drivers since those are used by ARCH_BRCMSTB
  platforms

----------------------------------------------------------------
Florian Fainelli (1):
      arm64: defconfig: Enable ARM SCMI protocol and drivers

 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
