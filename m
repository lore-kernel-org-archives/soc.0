Return-Path: <SRS0=C417=NE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E992C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Aug 2021 16:25:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F149D610A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Aug 2021 16:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F149D610A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Aq9F6wdaVXH7c+0fo3jR9hTrHtvCIQ/WZXFlDnm7GGE=; b=SLTz+CfCn7HO92
	UUP1/j0D6NRUIJSTglj8C/GUvEcsVRl6Um+yAtMWqCgQoXSOP+F/myqgjszUsUrmB4kH7m2LFBVd1
	rgQqBJ/F+s0sNMqiIKPTMshJ1ACVtib/UudrFSeaoHX+aBgtvDd5XEMA/PkcJtD6+ZFhFx4K8XS1T
	C7t2JSs2yoiX4rH0hcXS3Pv1CFDDrB10zbZlRj86Q4IIFwT78MFHaFF9bH2ScIoTZ3c828qKeTHOy
	JvE71XWi9jS1ZStxeQvpuprzTq2Fpzt/PNTPcAj9LH1lyTL+Qfzb9NNCynoS1dnEUzx/r5p8KqjKw
	hwzcgUJhjRlG0eugl/pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEZx8-00D5IU-IP; Fri, 13 Aug 2021 16:22:38 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEZwd-00D5C7-5w
 for linux-arm-kernel@lists.infradead.org; Fri, 13 Aug 2021 16:22:08 +0000
Received: by mail-wm1-x32b.google.com with SMTP id
 f9-20020a05600c1549b029025b0f5d8c6cso10029715wmg.4
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 13 Aug 2021 09:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=na+WKuSW69ggX7scxHBH8lK2fDYI3JGQA48xr5ljTBg=;
 b=uAI8DEbf+fOWer1VlBt0DU6R9RoJXUdqwH+7FrhTJ2M3emj0lIdaQsVys7sYtZytv4
 4V+PaD8MqEk0+DOAUVnQLrRDmNXKC+UQl3KLKQJbK7zS6MAKiPs3+2HN8WHa6PBacvGl
 ig9tQL93P3ZTY+GisuEs9vJARu2WQS2WnCr8Jj2wRB6T+XlmrJldcZ4MOcfy0uKwKOnC
 OCEhpK2YRr/O8vfJ7AQWwOhQ1Ce9NyUzmgc3doU7NXQBPSo6m1MkOcj7q2SQ6VVfOETI
 Zgj/U/W+M2TQscUyOd4C51uuW9Nga25Bbtl37cVXKoETmpy5V7bycEDiZxn7I08fO+uc
 XVlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=na+WKuSW69ggX7scxHBH8lK2fDYI3JGQA48xr5ljTBg=;
 b=QAzB9pwEPpGtmrDyrRDmVMO8iitzWMlCcqY5ym9s/04Xt84LWTbQudPlurr4g55t9x
 wzSwp/rJkvRkwTj0rze/4jWWluu6+6tOxAUVMKFfQBEmx9wieiZ86dodpT4n+Utlt2mC
 27lPWTa/6Xu31n3EICK/Fq6nE6wrFd28PIN2R6LLuinYmyiz47UTQqKnrFnBu8gJCu1I
 J+X1Md48OErzkTWHQHq7pS/FHpRGOlisLaEYSNVZHms3COd5vJxjCcg2KAZMXQQQIB1Z
 vWODfOFSsBYkjV+XvN8+gzdnYv1p1+jmQc8LxWyu+Ww5DWwVp9IWRIx5g8sCbiWspgev
 2YPA==
X-Gm-Message-State: AOAM533QoaxcD3gIRC/HIHMnCDSck8vsKnP24V81qseN++njJnWkzlLs
 IhxmNsQ1E2cI0Uuiwd5zEpQ=
X-Google-Smtp-Source: ABdhPJyR7mqyoJ/Ie3E1m/so/oG020CZ4raAk3ZnLRHH7Obbkp76F1v2zZNFWMVZkiXU2gCjnniS+w==
X-Received: by 2002:a05:600c:1ca7:: with SMTP id
 k39mr3650192wms.115.1628871725411; 
 Fri, 13 Aug 2021 09:22:05 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id g9sm1812046wmk.34.2021.08.13.09.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 09:22:04 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/6] ARM: tegra: Device tree changes for v5.15-rc1
Date: Fri, 13 Aug 2021 18:21:55 +0200
Message-ID: <20210813162157.2820913-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210813162157.2820913-1-thierry.reding@gmail.com>
References: <20210813162157.2820913-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_092207_261166_9B4E9674 
X-CRM114-Status: GOOD (  11.09  )
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
Message-ID: <20210813162155.jUXLiVKSgdkn8YDoZsAxd_euP466PYOGMzb6wEQe7MY@z>

Hi ARM SoC maintainers,

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.15-arm-dt

for you to fetch changes up to 2270ad2f4e123336af685ecedd1618701cb4ca1e:

  ARM: tegra: tamonten: Fix UART pad setting (2021-08-13 17:59:41 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v5.15-rc1

The majority of this is temperature sensor additions for various devices
and fixes to the trigger type of the thermal interrupts.

Other than that there are various minor fixes across the board.

----------------------------------------------------------------
Andreas Obergschwandtner (1):
      ARM: tegra: tamonten: Fix UART pad setting

Dmitry Osipenko (15):
      ARM: tegra: Add SoC thermal sensor to Tegra30 device-trees
      ARM: tegra: ouya: Add interrupt to temperature sensor node
      ARM: tegra: paz00: Add interrupt to temperature sensor node
      ARM: tegra: nexus7: Add interrupt to temperature sensor node
      ARM: tegra: acer-a500: Add interrupt to temperature sensor node
      ARM: tegra: nyan: Correct interrupt trigger type of temperature sensor
      ARM: tegra: apalis: Correct interrupt trigger type of temperature sensor
      ARM: tegra: cardhu: Correct interrupt trigger type of temperature sensor
      ARM: tegra: dalmore: Correct interrupt trigger type of temperature sensor
      ARM: tegra: jetson-tk1: Correct interrupt trigger type of temperature sensor
      ARM: tegra: acer-a500: Remove bogus USB VBUS regulators
      ARM: tegra: acer-a500: Add power supplies to accelerometer
      ARM: tegra: acer-a500: Use verbose variant of atmel,wakeup-method value
      ARM: tegra: acer-a500: Improve thermal zones
      ARM: tegra: nexus7: Improve thermal zones

 arch/arm/boot/dts/tegra114-dalmore.dts             |  2 +-
 arch/arm/boot/dts/tegra124-apalis-v1.2.dtsi        |  2 +-
 arch/arm/boot/dts/tegra124-apalis.dtsi             |  2 +-
 arch/arm/boot/dts/tegra124-jetson-tk1.dts          |  2 +-
 arch/arm/boot/dts/tegra124-nyan.dtsi               |  2 +-
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts    | 90 ++++++++++++++--------
 arch/arm/boot/dts/tegra20-paz00.dts                |  4 +
 arch/arm/boot/dts/tegra20-tamonten.dtsi            | 14 ++--
 .../dts/tegra30-asus-nexus7-grouper-common.dtsi    | 60 ++++++++++++++-
 arch/arm/boot/dts/tegra30-cardhu.dtsi              |  2 +-
 arch/arm/boot/dts/tegra30-ouya.dts                 | 13 ++--
 arch/arm/boot/dts/tegra30.dtsi                     | 87 ++++++++++++++++++++-
 12 files changed, 218 insertions(+), 62 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
