Return-Path: <SRS0=fGbl=O4=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0DB8C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Oct 2021 20:14:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D73161019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Oct 2021 20:14:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6D73161019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S1Wt52e2qClyy/U2nFw0dcQNK2JUULvO3ElS/r36bh0=; b=UnFAqkSnfi4aWG
	ombDpuJuX075eM0B3JMxJhEkbB8Wxk2eWN/ZQInzlWvxpvd9UgMYFa/fXyuwv5QLn8g5VbQk6oAKx
	L4+GQi+iXBJfdeWEExp5nteJkEPTqGMUuBw1BGPFsnW1b30bGL3gd3HXTiyDRcuv9MspgLn0ecl3D
	EwIvLadb3URAZnyNrV1CsTE/4Motz9jqAPLp2UnFDiBLa/uhSk2eVB23sFqb4Kym1qb96sKZsEemL
	KNHQxd4kZ9kuCWsnSMaUthLv3Am5pd8BB9XC4m94IgM+GbOBKMxrNfCY2t9wvFSUxraHc91vpFxtE
	WljTOaFApjkM9P9j+Mww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mYwEN-0042vm-FQ; Fri, 08 Oct 2021 20:12:35 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mYwDZ-0042ik-7G
 for linux-arm-kernel@lists.infradead.org; Fri, 08 Oct 2021 20:11:46 +0000
Received: by mail-wr1-x42a.google.com with SMTP id r7so33013667wrc.10
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 08 Oct 2021 13:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GaMkCDXAPf2zzbzPSS3SHKXSx5UyLXsAaofkvKwRahc=;
 b=qrHEyjZyO2e45qwd0XdaUIYhv+hUXOcwbsFQhJU9Wtcp8uP11nBRBOhSpCmpBZfQTg
 iy4stduEugSUQM83ajywaXEyFoD+anZYXAgDjs3ys8/ToCfJ3fXJ18LEMl6f1CURBMOo
 F17yA8CFqD/JEJHYWN2hODJy0Zoi5rllvoB2SaR7eWJdXppS0qNhUawk8hx72sgYlXZ4
 M1+u1gXp4eVsImi4xOh2z88q2j0nwIpmWtBpyUrjVupEX3iY5CcG5cDe3KkIQ2NxtzqO
 7feSky/t16fkRF9RDW/gPu863nRnY+rw6u65aPBgfR93ko9BUMywzqR9qV/2tGyOqobu
 DWiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GaMkCDXAPf2zzbzPSS3SHKXSx5UyLXsAaofkvKwRahc=;
 b=CGk/tMTLzPIt4SbD1Gp/c3esGzs15KBxN+UuTwRLlaK3YBlnnZnEbfqhgZR9Hh/A90
 GzmuVKw3+dmK2hgjllr6LzKihe2WkS26BynKt/vH3YvsXDwxOBZ3C9nSDn3ZRm+gY6Ke
 Xmu2GvMydZsIy+T1xAcFlqWHC27Tvbuz5yDUQAERQY6vEuTs6iS4sEiKEkQRSmhZMjCt
 yVe+NvR6YtBfa06G/g57vTr4rNYqcH7GocgbjWkNJbH4y4OjIR4/cKnMfTVdOAGn1t5o
 6QDPYPvcDLG+M3kJHozj/3S1YWlTy68qlYQ59APD2E9cM0qFYlfGZwPHhuL48Qyy6bpa
 iGLQ==
X-Gm-Message-State: AOAM532t8UYPs8AbAs59B9P1mTQsRq314U88Hse8ym2KQZf0alT8EjPV
 +1rflIKThRv8m0QlKdKNzRk=
X-Google-Smtp-Source: ABdhPJzUdsl+jyJQtzEmc3jeD02XVww5KUUKF1zqP1bw43gWE3PSySMJnKXFuahVkKblKjJhWQBl8w==
X-Received: by 2002:adf:a2d7:: with SMTP id t23mr6896509wra.156.1633723903685; 
 Fri, 08 Oct 2021 13:11:43 -0700 (PDT)
Received: from localhost ([217.111.27.204])
 by smtp.gmail.com with ESMTPSA id u24sm12018470wmj.48.2021.10.08.13.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 13:11:43 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
List-Id: <soc.lore.kernel.org>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/7] ARM: tegra: Device tree changes for v5.16-rc1
Date: Fri,  8 Oct 2021 22:11:30 +0200
Message-ID: <20211008201132.1678814-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211008201132.1678814-1-thierry.reding@gmail.com>
References: <20211008201132.1678814-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211008_131145_287647_1321A82F 
X-CRM114-Status: GOOD (  10.62  )
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
Message-ID: <20211008201130.bE2NIJbTrY6xNXWAshvhboeDwYiyOhKvtkb7TWUJrBA@z>

Hi ARM SoC maintainers,

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.16-arm-dt

for you to fetch changes up to 96f4adcd888d7ecb17ba5c88c141ed107cedf913:

  ARM: tegra: Remove useless usb-ehci compatible string (2021-10-07 20:59:48 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v5.16-rc1

This contains various cleanup patches to 32-bit ARM Tegra device trees
and enables USB OTG mode on the Nexus 7.

----------------------------------------------------------------
David Heidelberg (2):
      ARM: tegra: acer-a500: Correct compatible of ak8975 magnetometer
      ARM: tegra: Remove unused backlight-boot-off property

Dmitry Osipenko (3):
      ARM: tegra: Update Broadcom Bluetooth device-tree nodes
      ARM: tegra: Add new properties to USB PHY device-tree nodes
      ARM: tegra: nexus7: Enable USB OTG mode

Thierry Reding (1):
      ARM: tegra: Remove useless usb-ehci compatible string

 arch/arm/boot/dts/tegra114.dtsi                    |  8 ++++--
 arch/arm/boot/dts/tegra124.dtsi                    | 12 ++++++---
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts    |  7 +++--
 arch/arm/boot/dts/tegra20-paz00.dts                |  2 --
 arch/arm/boot/dts/tegra20.dtsi                     | 13 +++++++---
 .../dts/tegra30-asus-nexus7-grouper-common.dtsi    | 30 +++++++++++++++++++---
 arch/arm/boot/dts/tegra30-ouya.dts                 |  5 +++-
 arch/arm/boot/dts/tegra30.dtsi                     | 12 ++++++---
 8 files changed, 69 insertions(+), 20 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
