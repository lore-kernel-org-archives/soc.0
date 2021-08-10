Return-Path: <SRS0=SoTB=NB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52121C4320A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Aug 2021 07:50:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C79E660F11
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Aug 2021 07:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C79E660F11
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Cc:To:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PW1+rsobL098TuUe5wCjZDjZU7XAa3OXiba4D1d7Ui8=; b=BXzkJVq8Wy5A9j
	zJ2OC8DBd8TkwZiF1sjqcro2xUjZg0LJlKa4Q+wiuQB/zVIDmH4gKbh1+t03c8Vs1Zo1zd2ZZ2saJ
	bWPxLHGh9E+p9eht/7rBktjn8rs24qDZASA4UwPpLqEGv5haL1O3ROZhYUOhg9k8zHOC97rAgv0UF
	xYJ23c2SEr7J/qo6NXWow7V1aW90bITbRpb1FxPoqZgEDsNpJBrNE0+C2ymPXuqfAQXSWXE6ZMOo/
	CVH8/YvQdV+wg02ap9OV45/9+Gu6jCdhJGkDShiv10KtopPLfaQZY2ih5B9IoPN6onbiGVBOVJE5k
	RcIF+aiYh4gRh/rV88gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mDMTb-002nQg-CJ; Tue, 10 Aug 2021 07:47:07 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mDMTW-002nOq-8T
 for linux-arm-kernel@lists.infradead.org; Tue, 10 Aug 2021 07:47:04 +0000
Received: by mail-wm1-x330.google.com with SMTP id
 m28-20020a05600c3b1cb02902b5a8c22575so1877661wms.0
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 10 Aug 2021 00:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:subject:to:cc:organization:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=mMY+3Iw1nj2b/Q2aQd0QfbkRs3LIlo0VEMp/wdTkYzU=;
 b=pvrqck9031GYc3X4FKtmz1S/7ouU25CXmmkNYTp/10PZtEv7fXVhr8osGzcNzQ9Xdk
 ixAkmwi/Yhf6ek1yDZerRhIIg7LWOPd64FYa1I7RedVnMqUII6O51cSxQPEz5BfJGB54
 LpoUbUQwmJg0VM/I4OQMCvHrub2nSNWlwzAlGwTvlMgEcsPvFtLbZGj2Qm1BwChntMDB
 9uF2EPJ2Mh3C1AKaggb887mPqfySUGlyx3W+5TcBYJNAs81gx5kJAqQbBxUcbzQ18Csy
 2TnwbBzaBTWUBkeQHz0YUwXYtISIuTo4qAvbndLt3hF7PTp/eNauA1I44szElRZf4NLE
 yIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=mMY+3Iw1nj2b/Q2aQd0QfbkRs3LIlo0VEMp/wdTkYzU=;
 b=amvROEBAcRmGFtbi0C6Z7vrJILpqD45R5+SjRjnfpadI5Ww7MPOipDW+NRBK1uw6HW
 AooQPRBzA4cB9Dpn/tzi2cXJznAtOnEPIZz+v/jtyRrAhoyB+HQhPnzBGiBBk/uKiIJ8
 21xHHrxeu1GE6ekRokAKy5X1fcUMntEuQhyDPiZ8PRwWi/lVBLAWgHqjQ/LU7B/nXQbe
 RbRIJJeDfss9Y1QUv6vvqCWnX/tsgm7aLJaBFhUNJB41QT1pzi71AO/VS2PcarNbJ0bR
 LGXD9JfRkZadZNEdk+H5MkjHG6CYnhUGs9OjN75BDaVoeHV3VsD9RmtsM9x+GZcyYu5B
 27DA==
X-Gm-Message-State: AOAM533+ybqjNjPIwMAs19o/IKpQOiWkhbdEj2PeAJ+xUQrBiEP6MJx/
 LgmClAZIRZkg/SCo724dWfTBc+j3IJLQayRS
X-Google-Smtp-Source: ABdhPJy0HewnFwg113y3r+Z6/CQfDLmOhTwWK/xP9EydI6agD5CNikOQNmrIwf8Hs2XiVdOi/+9mKw==
X-Received: by 2002:a05:600c:3656:: with SMTP id
 y22mr3072890wmq.58.1628581620128; 
 Tue, 10 Aug 2021 00:47:00 -0700 (PDT)
Received: from ?IPv6:2001:861:44c0:66c0:b710:2b6e:27aa:f0a0?
 ([2001:861:44c0:66c0:b710:2b6e:27aa:f0a0])
 by smtp.gmail.com with ESMTPSA id r129sm19816813wmr.7.2021.08.10.00.46.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 00:46:59 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] ARM: multi_v7_defconfig: amlogic updates for v5.15
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Organization: Baylibre
Message-ID: <8e2b5139-86e6-0da3-75c4-d8df66448d51@baylibre.com>
Date: Tue, 10 Aug 2021 09:46:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210810_004702_334686_4A2AD9E8 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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
Message-ID: <20210810074659.27exyHMgVFMOe2R6yS0_d-ttBgM7b5xtJlQicRsCbQo@z>

Hi,

Here's a single multi_v7_defconfig change for v5.15 to enable CONFIG_MMC_MESON_MX_SDHC controller used on meson8/8b

Neil

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm-configs-for-v5.15

for you to fetch changes up to c8cec81305463d042d51af946b6b273d8367626e:

  ARM: multi_v7_defconfig: Enable CONFIG_MMC_MESON_MX_SDHC (2021-07-26 09:59:09 +0200)

----------------------------------------------------------------
Amlogic ARM configs change for v5.15:
- Enable CONFIG_MMC_MESON_MX_SDHC controller used on meson8/8b

----------------------------------------------------------------
Anand Moon (1):
      ARM: multi_v7_defconfig: Enable CONFIG_MMC_MESON_MX_SDHC

 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
