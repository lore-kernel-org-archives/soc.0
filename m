Return-Path: <SRS0=y0KU=J7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB387C433ED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 May 2021 19:37:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DCB461177
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 May 2021 19:37:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DCB461177
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hQRNvowUhIVWScTU12sETDetHDKLFiwxLbH8afrUjBI=; b=PPkRHkde5t9Jja11V4VdWBMNh
	9iRmfl+2aJGs4L0s51+9GMUWSmkU6mbS2ZgtTAfylW29/LFpDOO0T/R7u2PfSu0kMMDPvLlqBtFHE
	VkOR8T+dpdfj7+EA/jmOUPbRkwyvg8jlKam/M++8DrWAXNmSc/WNyw8K5C1C6gaIWntz68nqCdy/W
	t49eYKy/X5AMIiVLGWXERKJBAUUy7J1e3YvlanRnFv6/OMgmgbMGMY54M6Viub3BBNrbrjFxfv9Aj
	pYq85UYFuCg0EO/1JWR2hhwX10EYbkKk+/rGGmWwazCe+osasSZX3dchNPCcKkVWb2hpM2aki9Xv/
	AA8u0CqgA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1le0pL-00GuB3-W7; Tue, 04 May 2021 19:35:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le0p6-00Gu9R-5P
 for linux-arm-kernel@desiato.infradead.org; Tue, 04 May 2021 19:35:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=LfKwDo8azWN0Gbc7/pIjGO8T4exsCKBX4Y2Y1QqmWes=; b=g/K9W/m3h09XvuMKAu4OiGyy74
 zGwoDB3dyV8HqFxekfGO5L30SZa7AQKf8GX+ErXtqCzfn5l5T3ZoGOftOsd89FVnXKnndFIoguYKN
 tIMY+R0uyspzDnSU+REEEU+k9VHqYRyR6h6DIiL9S3RIX6kL9Ji+QWDEfGcnk8X/hjLLvTOti1tP5
 Fzje2OLvopuNN9m6gsAoIRrJx5mFZ77syZaWag1AX6+yJpHiPYfnkFhkGnORtxBvamLVZHzYeL6Ut
 FcPszwsIkvbvoK4Rg2pUmhG0TV5HfGT+pBxLwGRFNDUdxayHTl4dMkHYBZIDjXccf2cC5SePrxqsK
 PYx/pJ9A==;
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1le0p2-004DmH-R1
 for linux-arm-kernel@lists.infradead.org; Tue, 04 May 2021 19:35:10 +0000
Received: by mail-wr1-x42c.google.com with SMTP id m9so10655948wrx.3
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 04 May 2021 12:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LfKwDo8azWN0Gbc7/pIjGO8T4exsCKBX4Y2Y1QqmWes=;
 b=05o7ReA7rAKHmkd0VqX0nWa4Encxngxhb46pr43kojkbSgBP0EaRdX+231RbnE7zwV
 s4y9y+xh22lXXGpOg43Ruv9YkwYPEsdd2QJWzd2BjIAk4Bz1rvU6vJG0Rzi5t4iHdgZl
 oP1ALyF3di75NUU8tOAsdX0b8BlG+etuwHXMISnRlIUis5NNI5YPGRp3YYHM+vq2tMoa
 q8mWAOCNZ737fuPJY73g+re2opNW22UsDdP341L8hgxvL3UQWhWIpjwQp6HzQcvjPOr6
 0TBNYVrTFUr4iXI80KvYUV4zDsnoZ4ba5hOHpo+PABpIVXlej1HeH/SxnF8u7zxP1Qyh
 V8eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LfKwDo8azWN0Gbc7/pIjGO8T4exsCKBX4Y2Y1QqmWes=;
 b=fxdyRZOkGmEGt5XiXdTC1UKRKXPP7kfOf6x2fYOkt78ILbFxSqoUvdFndAnGztlger
 t7Aij3IEP8pbbjTSgKJt9Tb9NiJ0YXU3cGHn03/zxNSGVZYWiIIaHzYniYV79M0oWFH1
 QIzC4pi8qW5K24yl3Pr+uKsd3WJlNUmvpPOkYn1aRzknEIgyFiy/3Fb+dFa2nONDo348
 KscLGNcM8x5Sorw097w/ZNL9VMGjwD62+/4/hMfIYLg0wWYSXxeSTnZo4bllWhRQJIaY
 1tLtpCQnbgT0C3B09h1hU4Zu1xhw1hMB4PGCyPxucn8mIM2OrEle0XPjJ8ayLGeCTCYF
 foxQ==
X-Gm-Message-State: AOAM532MU+EH5+t9AfBO7rsarlzX95nIP0Sey6LHcLVhVBH8rQEh7yU+
 yum69UKn/iw6dhBAC0ieRz1jbKpMYcnrx1dD
X-Google-Smtp-Source: ABdhPJxWg+HSorQvF2RrlLM+c8v0lSWRGO+IpTTDPUTnfP8IIx/z6CvDhSGW889Qo1o4XqTfgq0yNA==
X-Received: by 2002:adf:ef90:: with SMTP id d16mr34040195wro.359.1620156904727; 
 Tue, 04 May 2021 12:35:04 -0700 (PDT)
Received: from localhost.localdomain
 (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.googlemail.com with ESMTPSA id x8sm17072136wru.70.2021.05.04.12.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 12:35:04 -0700 (PDT)
From: Corentin Labbe <clabbe@baylibre.com>
List-Id: <soc.lore.kernel.org>
To: arnd@arndb.de, kaloz@openwrt.org, khalasa@piap.pl, linusw@kernel.org,
 linux@armlinux.org.uk, olof@lixom.net, robh+dt@kernel.org, soc@kernel.org
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH 1/5] ARM: ixp4xx_defconfig: add CONFIG_SERIAL_OF_PLATFORM
Date: Tue,  4 May 2021 19:34:53 +0000
Message-ID: <20210504193457.4008384-2-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210504193457.4008384-1-clabbe@baylibre.com>
References: <20210504193457.4008384-1-clabbe@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_123508_891052_A7772682 
X-CRM114-Status: GOOD (  11.05  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210504193453.9KRZtsgfDJjlYV5fCXnm3ynldYO9c0J947DVDnlUxJk@z>

My ixp42x-welltech-epbx100 does not print anything on console without
CONFIG_SERIAL_OF_PLATFORM.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 arch/arm/configs/ixp4xx_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/ixp4xx_defconfig b/arch/arm/configs/ixp4xx_defconfig
index 0d6edeb27659..e3bcf2bed25c 100644
--- a/arch/arm/configs/ixp4xx_defconfig
+++ b/arch/arm/configs/ixp4xx_defconfig
@@ -152,6 +152,7 @@ CONFIG_INPUT_IXP4XX_BEEPER=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_NR_UARTS=2
+CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_I2C=y
 CONFIG_I2C_CHARDEV=y
 CONFIG_SENSORS_W83781D=y
-- 
2.26.3


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
