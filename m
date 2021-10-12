Return-Path: <SRS0=hZui=PA=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADF95C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Oct 2021 21:41:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C5206109E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Oct 2021 21:41:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6C5206109E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IzK3mjR8JxtkDoxWegFKbh2kgsqxWEW2bECATxY0CQw=; b=MC1qP9yvyPUeuG
	OoZALxqz5RhJIWlYCSc9lmC4/6F8sUQkDgXZ609HDCw8GiXGNdmUcNZPN+HoscTMIwjf6DdkeKa7v
	Ut3mJH2m8gaCcwtEAQanP8oEmUK+cLrse+So/06E+oTZPj3cdIkA68mqrPWUNTOc8E06O3Y9m6p1R
	0YiJVpQO3xt2K1McBde1+IRxcbhvSHkUNNQP2XsheeAGdZrt34MPjtnaOkvEoSn7U6KcuszYY/auI
	0tvLdRgTZh2w1KjXO8UcqoRd8Jf6OQaNLNqu3NuKtrZJ0RXfIzplEiHtUkK6cjpll6pGAlefjwKjg
	tmmx9f6jeBKuo2ImlFRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maPUA-00E27f-4W; Tue, 12 Oct 2021 21:38:58 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maPU5-00E27N-K0
 for linux-arm-kernel@lists.infradead.org; Tue, 12 Oct 2021 21:38:55 +0000
Received: by mail-pj1-x102e.google.com with SMTP id
 d13-20020a17090ad3cd00b0019e746f7bd4so2911661pjw.0
 for <linux-arm-kernel@lists.infradead.org>;
 Tue, 12 Oct 2021 14:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7KSFiVfnSAs3/SNg960Jao534TVHaMEf6Q67ELHvISI=;
 b=C4opyIm9SXR4jj+Fws/OgRQpZWSkl5zCHCg8W+exJw5zbNkWCzTHGJz8/1LOkt6nO5
 wWlQsQC7+TP7k99tZzM4Otwa3K2QYUd6kG0A1SEdrPZXWaChnxqz9sZ0r64CBr/ogS/P
 eSPsEDzamJ/61iGY8bDJIpiDCRN9PnOMLDTuDWkJcZmIdOUR3RL5ZrA2yfklRwsMhVT1
 wOdC/X/V+XMMej0iXAhe2CGUZXODvnJdUSbs5BM9pdvOxjMxZubX83cOyCErZSSJ/TKZ
 jwbUKrLIjLr5caYiZISFHV60zQzUXdVo2OVmF4p05LBmfklE54VACwLxApIH2x0W09l8
 cYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7KSFiVfnSAs3/SNg960Jao534TVHaMEf6Q67ELHvISI=;
 b=OTbuLo5Pf+7OY6mxCm4BJR6GVu3+Mzgq6xHF+Qiu8jbjJGWS6trOrmfoOqHgC67sfP
 K3tIPsc5kPxjGaaJPahD/yzS7SrbAzPlUJxdlpTuYJ4YJURugD5uxoIUdE4vRB86AUjK
 VJ4o9tf2tenJSs0vZDt+T0n7Vpjd5K7C8Xi0RdkWzSBZBKhKQ1g7XKktjNRLjF0kx/H9
 /rwpeGpCfFnaiwHXskojYFuF++JoJc9evYYn7RLJMQPUOgtok0IJwX7FNOfjcTeaMRy3
 6CUz2baLxb/dQ6JnSpTe2lwG2/uwcp/GzM+6DbA+WHJp8DuCRlKAw8f/CuRN0i/6LNRC
 Y4Ow==
X-Gm-Message-State: AOAM530UrMwuitoYw7gr3c/Ms8ukpbfSUblb2WMQXqpiw1WG2EizKZAF
 wteJH5HuUUJ610KuhOIK6bA=
X-Google-Smtp-Source: ABdhPJzMBFE0A5cRVwl7kVYDyhUTDj9CqIXhgrD54W9yDJtzEWnmSvOBI1Ud3uI5+ROMFyJl0eVH2g==
X-Received: by 2002:a17:90a:7345:: with SMTP id
 j5mr8947209pjs.48.1634074731557; 
 Tue, 12 Oct 2021 14:38:51 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id 130sm11629721pfz.77.2021.10.12.14.38.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 14:38:50 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
 Nicolas Saenz Julienne <nsaenz@kernel.org>, Rob Herring <robh@kernel.org>,
 Stefan Wahren <stefan.wahren@i2se.com>,
 Mateusz Kwiatkowski <kfyatek+publicgit@gmail.com>,
 linux-arm-kernel@lists.infradead.org, arnd@arndb.de, olof@lixom.net,
 khilman@kernel.org, bcm-kernel-feedback-list@broadcom.com
Subject: [GIT PULL 1/1] Broadcom devicetree fixes for 5.15
Date: Tue, 12 Oct 2021 14:38:41 -0700
Message-ID: <20211012213841.1872021-1-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_143853_739584_BC586AE1 
X-CRM114-Status: UNSURE (   8.91  )
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
Message-ID: <20211012213841.TKeq9bf6v_3QLpeVSwhjcWYp3DeZTPho_z5IkN_Nd3E@z>

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://github.com/Broadcom/stblinux.git tags/arm-soc/for-5.15/devicetree

for you to fetch changes up to bc22b6208f416ba702c17a93c9af6474f19e8212:

  Merge tag 'tags/bcm2835-dt-fixes-2021-10-06' into devicetree/fixes (2021-10-12 09:14:30 -0700)

----------------------------------------------------------------
This pull request contains Broadcom ARM-based SoCs Device Tree fixes for
5.15, please pull the following:

- Stefan fixes the VEC (video encoder) bus address for 2711, fixes the
  MDIO bus controller #address-cells/#size-cells inversion and the SDIO
  regulator voltage ranges

- Nicolas fixes DTC warnings for the PCIe host bridge and its child
  USB device

----------------------------------------------------------------
Florian Fainelli (1):
      Merge tag 'tags/bcm2835-dt-fixes-2021-10-06' into devicetree/fixes

Mateusz Kwiatkowski (1):
      ARM: dts: bcm283x: Fix VEC address for BCM2711

Nicolas Saenz Julienne (2):
      ARM: dts: bcm2711-rpi-4-b: Fix pcie0's unit address formatting
      ARM: dts: bcm2711-rpi-4-b: Fix usb's unit address

Stefan Wahren (2):
      ARM: dts: bcm2711: fix MDIO #address- and #size-cells
      ARM: dts: bcm2711-rpi-4-b: fix sd_io_1v8_reg regulator states

 arch/arm/boot/dts/bcm2711-rpi-4-b.dts | 11 ++++++-----
 arch/arm/boot/dts/bcm2711.dtsi        | 12 ++++++++++--
 arch/arm/boot/dts/bcm2835-common.dtsi |  8 ++++++++
 arch/arm/boot/dts/bcm283x.dtsi        |  8 --------
 4 files changed, 24 insertions(+), 15 deletions(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
