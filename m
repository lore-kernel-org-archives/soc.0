Return-Path: <SRS0=IRvS=LF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5EB2C48BE0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 16:46:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A83BA61078
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jun 2021 16:46:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A83BA61078
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AXA8auMA2J9nICdm8yyPz9p2NCw7qlYPB5cIXzAdgrc=; b=LPMjL9lbXIQhF3
	694OX7SkjWiR4QwBLMMR7/BzNeseHSn9LG8lJy1s/z/X5HV96AN0RI0cyJJACwn7kGcBYj7XjyeLg
	KEzNv0OxCsHt4U7ckVg3M0vv0LUKECAk/A7llcPIAhr+juo2tC/6qCqpvwGmuLxkJrahJmce+2G2q
	Rzmi1LKQOz2tfuutgvTFg7eFaSBxlNRAi22p3Qr69llQe+QdlDVGXPY3Y7UcKeKdFySjn63u8VX9t
	mkhDBlPtbilTdG74jTClTXfwRXTSz7PQIB/CECaHxuclB2r9KuU4trBQsbdIjWd2e6oHw3j5wSo0y
	wRXMG7jaOpNbWpttCRLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrkH6-0064qS-6j; Fri, 11 Jun 2021 16:44:52 +0000
Received: from mail-wm1-f51.google.com ([209.85.128.51])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrkGR-0064Te-I7
 for linux-arm-kernel@lists.infradead.org; Fri, 11 Jun 2021 16:44:13 +0000
Received: by mail-wm1-f51.google.com with SMTP id
 3-20020a05600c0243b029019f2f9b2b8aso8946175wmj.2
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 11 Jun 2021 09:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/DDhEhmd/WWK/nmogtTO3okii3O3flMjdbqXxBBxu0U=;
 b=lz6oU35YVQA5fAK7pA7HTI+BEiNXOMWV4Sh11Ysgg6MZU84SMNZDk/grXDOHr2dpmK
 5JreUnXQrC+mc7KEujTHacVBcaRczS4HWp72t+JVoh+LCRDabWbTlAbk24gfhQKrZzMI
 /+OtA/ZuuZiU5z1FRd90YnILbA1eIg4qXDiz5rpCp3plalERRqeEal9Et3PhFbRqJRqV
 QbHwFy5H+aU8zi0kZsNo4xPcxwfhLtXx+fSSQZhIVvKLBuD0HoyhrCUmey2/Yz+X1MLi
 x7SQXSmbr5C60h8W1xCwB2inVpMARJmhvjkBR8bo8ZyKJ8KLtixZ4/Ir+n9a4pfvY28p
 ZpXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/DDhEhmd/WWK/nmogtTO3okii3O3flMjdbqXxBBxu0U=;
 b=CfIixSC5vguyfoKi1mrCBYZLs+tAO3qOQOCKQiq3q6PyhjNlL9xUVlW+zK9YUnlyG/
 UfxdC5Lqb7H1Zx/sAUZPIxIY2HcE5EXXdHB+ctpuzssxRUSoFGj6vGDzEDQR4/BIMspn
 HKSxTuZB24suqZ5Cd5acW2SYnbzLsFUJdbQgb6uYJI/P5IEsxWhskw6/gXRtVbkeQyer
 0LheE3BZQq7VEWdtHCrml4TSwfCfu8WPexUHxUN2tB3v2ryZftGNgfkb2TjdiXQaJtTn
 30jlTJMmaTLhmgrCD2it7F2fsk41IFVOBbraLOK0jDLpmBxeu49ZbNdUHhhuLHIOzFZc
 gxIg==
X-Gm-Message-State: AOAM533s1n+022YTWnrxwSbZFezgTrQgRV18+4VmzJoFMSZ3M4KBNENV
 8usr0dVOciN7BRaGfBtiqYY=
X-Google-Smtp-Source: ABdhPJxmSVTeUcIzERg8Pc4lCkUbFiPFHCflpAJq+LBSKHgIism1xc/jsLbY+QNRNkUHMKA5P+jErw==
X-Received: by 2002:a05:600c:4fc5:: with SMTP id
 o5mr4925670wmq.148.1623429790181; 
 Fri, 11 Jun 2021 09:43:10 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id x10sm7604589wrt.26.2021.06.11.09.43.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jun 2021 09:43:09 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/6] ARM: tegra: Device tree changes for v5.14-rc1
Date: Fri, 11 Jun 2021 18:44:35 +0200
Message-ID: <20210611164437.3568059-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210611164437.3568059-1-thierry.reding@gmail.com>
References: <20210611164437.3568059-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_094411_661886_0FAAAFDF 
X-CRM114-Status: GOOD (  11.00  )
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
Message-ID: <20210611164435.Sy-CyvJxiEBUFM5BXUnBaYnfNcPJ_M8rQCpcNnmdS3s@z>

Hi ARM SoC maintainers,

The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.14-arm-dt

for you to fetch changes up to 4c101a4466983abe7798493ef17279cc3f8eb028:

  ARM: tegra: ouya: Enable memory frequency thermal throttling using ACTMON (2021-05-31 11:40:29 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v5.14-rc1

This contains various improvements (such as microphone detection and
thermal zones) for some older Tegra devices (such as the Nexus 7 or
the Acer A500).

----------------------------------------------------------------
Dmitry Osipenko (13):
      ARM: tegra: acer-a500: Improve microphone detection
      ARM: tegra: acer-a500: Specify proper voltage for WiFi SDIO bus
      ARM: tegra: acer-a500: Bump thermal trips by 10C
      ARM: tegra: Add reg property to Tegra20 EMC table device-tree nodes
      ARM: tegra: wm8903: Fix polarity of headphones-detection GPIO in device-trees
      ARM: tegra: paz00: Add CPU thermal zone
      ARM: tegra: nexus7: Add i2c-thermtrip node
      ARM: tegra: nexus7: Improve thermal zones
      ARM: tegra: nexus7: Remove monitored-battery property
      ARM: tegra: nexus7: Correct 3v3 regulator GPIO of PM269 variant
      ARM: tegra: Add cooling cells to ACTMON device-tree node
      ARM: tegra: nexus7: Enable memory frequency thermal throttling using ACTMON
      ARM: tegra: ouya: Enable memory frequency thermal throttling using ACTMON

 arch/arm/boot/dts/tegra124.dtsi                    |  3 +-
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts    | 21 +++++++----
 arch/arm/boot/dts/tegra20-harmony.dts              |  2 +-
 arch/arm/boot/dts/tegra20-medcom-wide.dts          |  2 +-
 arch/arm/boot/dts/tegra20-paz00.dts                | 43 +++++++++++++++++++++-
 arch/arm/boot/dts/tegra20-plutux.dts               |  2 +-
 arch/arm/boot/dts/tegra20-seaboard.dts             |  2 +-
 arch/arm/boot/dts/tegra20-tec.dts                  |  2 +-
 arch/arm/boot/dts/tegra20-ventana.dts              |  2 +-
 .../dts/tegra30-asus-nexus7-grouper-common.dtsi    | 16 +++-----
 .../tegra30-asus-nexus7-grouper-maxim-pmic.dtsi    |  9 +++++
 .../dts/tegra30-asus-nexus7-grouper-ti-pmic.dtsi   | 11 +++++-
 arch/arm/boot/dts/tegra30-cardhu.dtsi              |  2 +-
 arch/arm/boot/dts/tegra30-ouya.dts                 |  4 +-
 arch/arm/boot/dts/tegra30.dtsi                     |  3 +-
 15 files changed, 93 insertions(+), 31 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
