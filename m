Return-Path: <SRS0=+cAE=PB=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA626C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Oct 2021 16:26:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 861EB60551
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Oct 2021 16:26:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 861EB60551
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wCm7VDZU+Eq93HZYhtYH4zNBei9+a14MA9X5j8lVkXA=; b=Z23QeE4jtM6NYS
	UOPln8dQOF5FjzUAxYP3qRPLfTUH3zvE3sIn3qTp2v3OW4WurIYq6HxM+kDiRBtqJkXH17wHf+qDH
	F1CRSPcEy+TsmLtiOhlJEJFgcqUl6RVnG1Ls49V3QaI+KCiY3TahGKpByoNs76erXDqoovb70rzXu
	WmWJ3LWGiWUcbheqYGgvsbjvP+vl8/JEeED7Uxkc+A4e9zYm5ojuVvmAzvZmswGfivsNSpbMzLILa
	sSoaHjG+dhvMPzYVLBDxzZsPw822MYPQrFB/leYqRurSz8igqpEu3mm7qPkC6VSPpYcYYC438Zi3O
	pWFjAnKSgNbpN1ybbdfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mah3M-0001X4-Ut; Wed, 13 Oct 2021 16:24:29 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mah3I-0001Vb-QK
 for linux-arm-kernel@lists.infradead.org; Wed, 13 Oct 2021 16:24:26 +0000
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 595DF3FFD9
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 13 Oct 2021 16:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1634142262;
 bh=rIEj21HHKhJcsySyHApcwExmEsShxKv23rfMFAlFGSI=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=V4rg/Cz/R+BoFKXe4B+BYQ0rHB/1jqbZ8RqoHNbCPlWmfuyllcIezoMCb0hltroJH
 gn2nn6w2JGMWRLUuNT+G2Ylw7zPf5ZWng82mNNq6V4dz0st0F0ItEGQL0PsVz+cbKe
 0iQ6HF9n6i2/4OR88H+w0qUnHwIQb0PGbRowcsXnNPXUZJ0jKOh99pckIxAlvTlg66
 UcT43/rBnhQvZNeNDlmRODXAnx1JnEL5HA8h6pJ1itPBMmyqazDBhrdCdEmOSnYRdB
 AvHF/d1qP7x/yP/Xl7ttfKNstkDq9Px3X7ajE0poDAR4De6x7T23BXW/DIPsbaDzhv
 60QJSsLEgEQzA==
Received: by mail-lf1-f71.google.com with SMTP id
 k8-20020a0565123d8800b003fd6e160c77so2373043lfv.17
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 13 Oct 2021 09:24:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rIEj21HHKhJcsySyHApcwExmEsShxKv23rfMFAlFGSI=;
 b=7J5DaMy3o/MyQJtlUz1YzSKIm+ASyp5RKP8ajFlp1dlUYjnlgt1/BLQUUB7yR2JL5D
 4qhwfjOfrWuFy8s/pJ0f+gevWdtqvYby8UpJhlO1LdN05Y9tmoDwvU6UXINg/YcTzj8x
 Mdp2kAmGUM86j5EzFyLnZUYra0pL6cEMzIaratSc9vG1c3mBS0HJilyLR2hFfmUBpH5M
 nwQKFKhf4+OF9t4HSv+dKUXKrB1/tkYWkr3eLMuwTrVW3l8ChMXb1rLnjIA1Bgyn1M5D
 8CX8UAvZFLfFtGOc7t5cFofzzmvr1l4JTPGnTv8fzUC6xiKkkvui+o137VIO8n7H5wrf
 PDzw==
X-Gm-Message-State: AOAM532D7fPjZbeOOQj4hGJDMWfBJ7CbMsHgoAYf35PZg09BKFNfgw7i
 U1+wFLSu0DqrOx/TLpTf9EpBNv9xzWMECpzZ6ROyrAosUeGxPfnBXqLN+EQKtMTERDyShv9wIHD
 GfGdbFi8XjrbGB1nooJ0gRTqIkIAyEgTGiTKiY36tK3PfUjzE9nJp
X-Received: by 2002:a2e:9790:: with SMTP id y16mr323447lji.175.1634142261793; 
 Wed, 13 Oct 2021 09:24:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoTIiea+8iBrlt5YSeJhanTDXQjxIM9l83Tywf3oR1RICkS2ZGaOCR5f49WvdAq4nAXfiLdA==
X-Received: by 2002:a2e:9790:: with SMTP id y16mr323422lji.175.1634142261620; 
 Wed, 13 Oct 2021 09:24:21 -0700 (PDT)
Received: from kozik-lap.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 r3sm1372281lfc.169.2021.10.13.09.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 09:24:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm@kernel.org, soc@kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/2] ARM: dts: samsung: dts for v5.16
Date: Wed, 13 Oct 2021 18:24:17 +0200
Message-ID: <20211013162418.43072-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_092425_100320_DA35D461 
X-CRM114-Status: UNSURE (   9.55  )
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
Message-ID: <20211013162417.ZFQMpyWqVStu2beKXJM0AR4HjB2TS3y7QP9iZ9lZQO4@z>

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.16

for you to fetch changes up to 7ec804d6025c952e3122ad7fe768178efca3300e:

  ARM: dts: exynos: use spaces instead of tabs around '=' (2021-09-30 13:45:55 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v5.16

Minor cleanups - from undocumented or unused properties, coding style.

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      ARM: dts: exynos: drop undocumented samsung,sata-freq property in Exynos5250
      ARM: dts: exynos: remove unneeded DVS voltages from PMIC on Arndale
      ARM: dts: exynos: use spaces instead of tabs around '='

 arch/arm/boot/dts/exynos4210-origen.dts  | 24 ++++++++++++------------
 arch/arm/boot/dts/exynos4412-origen.dts  | 14 +++++++-------
 arch/arm/boot/dts/exynos5250-arndale.dts |  3 ---
 arch/arm/boot/dts/exynos5250.dtsi        |  1 -
 4 files changed, 19 insertions(+), 23 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
