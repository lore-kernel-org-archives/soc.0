Return-Path: <SRS0=Q6KY=HT=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91521C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Feb 2021 01:18:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40F6564E2F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Feb 2021 01:18:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40F6564E2F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rdYvU6C/RzQy7YSMdwcEiZSmtc2rOogp2pTkXfrTRNM=; b=mWeVPUmmo8LfeoDoHJ6NPiNPWJ
	670toESz1Blp3y9n6D/1LTI/2tJo3ox4ySU0dfhDV0RlC9Ef5I70PqWSNqps4bK2p2aiTYcIrgiV3
	WgLogv2oYFEDheEQgCltYd67OvnXAXQBtx8FM8Q0A/T/k4Ms1xGClAKWxMJQA/7nuocprIQJm09IU
	ul/QJ6pnikeEnmvS1MDPihHPHprRn93sHPnSsw/+59r2YYYmqS/1fD0Jw5aWHMUV5D1/DLozaRppC
	HEroZsKkyU/MsXo4L6P0Ad3CLuHeIgnDe+OyiLrWpBkVMTmfnnYiWIuUfQy1IE9kYze/a2L/10LmZ
	9H4NnN6A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lCBSm-0005Ct-D2; Wed, 17 Feb 2021 01:17:08 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lCBSi-0005C4-4a
 for linux-arm-kernel@lists.infradead.org; Wed, 17 Feb 2021 01:17:04 +0000
Received: by mail-pg1-x532.google.com with SMTP id o7so7461859pgl.1
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 16 Feb 2021 17:17:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qzbulnVJvkxHQqgd6L0cuy16ntsVshSWo2ZahMwyOFI=;
 b=WZ45NcvUVJENtrhS1GQ+G9m9qBfjydOd5ga9u6FyXstZJ2KkVEhYgqwQELicsKK6M6
 fayoIHiI9Dq2be/l0nsv+aWGGJxEh9ma5SJ9dNtHEl2CFvbyfxZYBR2qW66Jm4uNflby
 5oP1t7OlUtIknl4+x/Jrmi2qY/U4A+sj3dnK2LJfbclWWzE5IJ4cHHekIENdHNKy2wTX
 bRyqBse84MACBcH6nYkH0EaYLLNQtx6YyYN+SP5J8t0UvhznfULGnd/KAI/GhjE4Y6q2
 1FQfeO8JDd1gREUE5NCNRo16SKzwkwEk3dQXW3Cx6rX/1KdVcE4h0mL/cO8T12DmcVLE
 Iq+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qzbulnVJvkxHQqgd6L0cuy16ntsVshSWo2ZahMwyOFI=;
 b=C3nZdyRfetwqEjqIlZrftwTvxL0AJh05GeRivE6FtxtaYGa4obr3gNQij2hJrIV7sV
 Ae0oOt4eGL/q4Hu7GSBlIZDLd4t+Jsv3cNK7WDUXKneJN76NhxEiOblXZprQPwWU+xB9
 TDzg5rvpIzFI33gG+r1wEswe8ioJsTeA1Ko2jgUxVxYB83f1wDK1138jfQnxxqSMAV7J
 Ux/jO/XLp3jFWc73Hk21VmGIr/X+LZYZ3gzAkWotk/DbAU6Zv24vaKVfGW77JF3Z4JJZ
 ukaruOKaig5tNn30s+BqEwzL5n1/oSImQyuYFp90M0AgGYTWvYcoSM2QXfI7/xckAW+E
 LuOQ==
X-Gm-Message-State: AOAM532PjPjaUo/rbB0q1HZRUqFDetivjFGQ/P7+Sw/CXB6IAAyOoVD6
 TZEPl0KwOQVy3yS1SOkbVCo=
X-Google-Smtp-Source: ABdhPJzK31tTvES4U9HvYNcCjb38B0r2zZrB2k40n8zceRiitb7+ReZfS9GAaOsFHwb5f/PbH/Q1eA==
X-Received: by 2002:a63:c44d:: with SMTP id m13mr21706170pgg.64.1613524621621; 
 Tue, 16 Feb 2021 17:17:01 -0800 (PST)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id f3sm316046pgh.75.2021.02.16.17.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 17:17:01 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Subject: [GIT PULL 1/2] Broadcom late devicetree changes for 5.12
Date: Tue, 16 Feb 2021 17:16:53 -0800
Message-ID: <20210217011654.2561426-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_201704_214191_5E5A9ADB 
X-CRM114-Status: UNSURE (   7.26  )
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, arnd@arndb.de,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, khilman@kernel.org,
 Maxime Ripard <mripard@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>, olof@lixom.net,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210217011653.1oX_zuBKL7n5geIbg9PIKzTI2tHjwkucM0rSamIGgmY@z>

The following changes since commit a0610b409fc9f90b4861c021ebe853bfcc310bb3:

  Merge tag 'tags/bcm2835-dt-next-2021-01-28' into devicetree/next (2021-01-28 20:11:44 -0800)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.12/devicetree-part2

for you to fetch changes up to 443f0bb8e29fa031ec4d5beb3c3143350438dc97:

  Revert "ARM: dts: bcm2711: Add the BSC interrupt controller" (2021-02-16 17:11:40 -0800)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoC changes for 5.12,
please pull the following:

- Florian reverts the adding of the second level interrupt controller
  for HDMI BSC interrupts since they collide with the main I2C
  controller (i2c-bcm2835).

----------------------------------------------------------------
Florian Fainelli (1):
      Revert "ARM: dts: bcm2711: Add the BSC interrupt controller"

 arch/arm/boot/dts/bcm2711.dtsi | 12 ------------
 1 file changed, 12 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
