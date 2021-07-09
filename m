Return-Path: <SRS0=XzzO=MB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A398C07E9C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jul 2021 15:01:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53111613BE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jul 2021 15:01:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53111613BE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Smn+l7OdjvQWZ+yG0QwT9Qpl9tXSNxbiL+soMrsK9m0=; b=ojmLKTSdJxX17m
	s+yrlqcgKaTt44Lw0+uim4sNxjxrKcHB6An7ehcxW2H+yglcZL0xJZ5Gp/kKRRFrTKSoD5l4xjAuh
	xEsuZ9xn5ilIZnit769Pooq4Yo/B+iZpXBG2oFoptz1DCMus3SUuJWhkWV3CcCQgmeZxYotGfQw20
	JQTH5d1g7e75+2SalPZR1Vb09nQoJjrxPZWozIqlEogtwA7WjedxGjqceVTG96OlfJXpJGmvdy+/w
	WsiJ/BSFLzdqenhXrUXWvztHqFaG6OhD80eOLG7KkvCiSm0gz4aImdIFl44fthyqQgjdT2wuLdu3z
	r/tQBwrYJx96vrwas2dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1ryp-00209y-Ds; Fri, 09 Jul 2021 14:59:51 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1rym-00209A-2Y
 for linux-arm-kernel@lists.infradead.org; Fri, 09 Jul 2021 14:59:49 +0000
Received: by mail-wr1-x42a.google.com with SMTP id r11so7286333wro.9
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 09 Jul 2021 07:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jHuEH6VsYLXBeTed01/PCBU/Wx1MdyeMJ1LOOQ3q82g=;
 b=bkLFGL1Ki2kGuJjjxDQAnSYbGZ3QwNv/xzmqVljJc7TYEuwaiWAkewSqwuUHRVnoJm
 qlF+IuWNiJBnERnSAieKDBdRqrRKpBQZFTPWoQBqZqR9jqGplgJIvjljoerqn2TnwuHq
 L7KW1G1de706S0XGM8RLslnu/3sArdx4VJWyrNhS8dhOKUYkBpQJJLrhifq/g9RD703q
 +edKn9DO7WMauCKhLpOPFhBIFXhRAiakvEXO/7k/bX4LojUmja0US0untDgBdowxOGpW
 o2/8RRuDTUlyn2tbpNOG01sirdzo+Y6UjNbih9NgtWDxFVqfOKFGtJHmg+YcKN7ThPFH
 nDJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jHuEH6VsYLXBeTed01/PCBU/Wx1MdyeMJ1LOOQ3q82g=;
 b=XIMlGVXX5mZWbgPuTST0F+cQOcktw40dgKT08MCVSlIMkgvx73oJ5N/W8fx8TO6goW
 ruXMR/UyhpS8FVhCJdcwR7I3quF7Fi2Ofr+6cRGc76p2iN0bdUstV3kWp/b08dkTgond
 mLwHaFebh8nG+MUXf4DARCCnhm2ZIMyhtHQJPwozrI3wnWvj52BZ/aJ9s/0AXE6LyOYG
 b9gsNkU14edY/x//KU+KUlTkvkbFzkZbY1Kly+CDhtHKHDbWefY+wGJ3dmUipAaPQVE3
 F5KYF3YOmBrXdOm9o/2VGjCTCl4/ZnHyyV54sbGcVkVWDINs5aBYyklwqGMoM2HFpUr8
 4/Hg==
X-Gm-Message-State: AOAM530fOOOLB3p2s+LDvbmCPOCO2Dofn06SJRQzs2n2HkBEYhc2CQeD
 OtidwDaPgG4OPkneCTa7KU0ba9nIeys=
X-Google-Smtp-Source: ABdhPJyE1Zjuu0MGKQaBtvJmvkNkwxiaUJxirymFDhJyeu7I79a7aw1xLbpCLt2jRmKbjc2YGk9obQ==
X-Received: by 2002:a5d:6e81:: with SMTP id k1mr42163312wrz.144.1625842786688; 
 Fri, 09 Jul 2021 07:59:46 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id y23sm5197490wmi.28.2021.07.09.07.59.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 07:59:45 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] arm64: tegra: Device tree fixes for v5.14-rc1
Date: Fri,  9 Jul 2021 17:02:20 +0200
Message-ID: <20210709150220.2543875-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210709_075948_158954_272B8B3D 
X-CRM114-Status: GOOD (  10.05  )
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
Message-ID: <20210709150220.btvW9Nlb4r3WzrgHLMbG2XBgUarvZzr5vYldk8GIkbc@z>

Hi ARM SoC maintainers,

The following changes since commit c7289b1c8a4e10bbbdb7097a71a90652beb767a1:

  arm64: tegra: Enable SMMU support on Tegra194 (2021-06-11 13:33:46 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.14-arm64-dt-fixes

for you to fetch changes up to c667dcd4dfcd515ad2c9b3953a33d742985a0b5e:

  arm64: tegra: Enable SMMU support for USB on Tegra194 (2021-07-09 16:50:44 +0200)

This is based on the main ARM64 device tree changes pull request that I
sent out a couple of weeks ago. It'd be great to get this into v5.14-rc1
or shortly after.

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree fixes for v5.14-rc1

This contains two late fixes for Tegra194 device tree files to restore
USB and audio functionality after enabling system-wide IOMMU support.

----------------------------------------------------------------
Thierry Reding (2):
      arm64: tegra: Enable audio IOMMU support on Tegra194
      arm64: tegra: Enable SMMU support for USB on Tegra194

 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
