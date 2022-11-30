Return-Path: <SRS0=sDuw=36=arinc9.com=arinc.unal@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1198C4167B
	for <soc@archiver.kernel.org>; Wed, 30 Nov 2022 00:34:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id A81C0C433D6; Wed, 30 Nov 2022 00:34:27 +0000 (UTC)
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 14ABEC433C1;
	Wed, 30 Nov 2022 00:34:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 14ABEC433C1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=arinc9.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=arinc9.com
ARC-Seal: i=1; a=rsa-sha256; t=1669768462; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BBpR6MyotQsGL+IMMh9k3QHJs+hzJ+/egYu+MuBJvYxvH25hSB62vqSmKKPplIKbMjr0enHqFi3EQh4yQ+cm91/IKHmQUAT3yqClgrQ8uBwZpMs2K4hKl75Rp7PRPVrFhYBY/j61BcaZ7gQ9PTvgBuiCoyTUwJkxUopzLEXj0a4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1669768462; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=O2TgEYk/NsxCmz9BPi43vQuNSdWZ/gHxYPsrPh6Zb8Q=; 
	b=iTlrUce6zVsoY69xGETS2Q40F8nKm5xxU746ly5+ZEU0LyuVBpdJV9furuzb5T60AeKtfgYdS1DxHqzl66Z/jXAPGqS2ACgi0cYWqFevCDpwe0Dg6xrLCGVWS4vjEpcdBEosC6NIYTe39k01PmYbuV2Ws4mBWjG6Jbw95WFM4wA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669768462;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=O2TgEYk/NsxCmz9BPi43vQuNSdWZ/gHxYPsrPh6Zb8Q=;
	b=bx/QcQ8ZI2oif6aaw+k7zOmMDWAWao2YDv0nsW/MlnveY5tHtpl4/rnTxP2tVbod
	qqrai8i3hCg7nM1sX5iOZ37NTiR+5x4RCJv0RALVIr6t7BIe8t2PyjBTQCWVrvCE6hs
	7sfkcuPnkH2hO12AtSWI+eIgw8I8CS4YAKqI2Hqo=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1669768460919386.7938367217614; Tue, 29 Nov 2022 16:34:20 -0800 (PST)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
List-Id: <soc.lore.kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	soc@kernel.org
Cc: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH 0/5] remove label = "cpu" from DSA dt-binding
Date: Wed, 30 Nov 2022 03:34:05 +0300
Message-Id: <20221130003410.191837-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

Hello folks,

With this patch series, we're completely getting rid of 'label = "cpu";'
which is not used by the DSA dt-binding at all.

I've been meaning to submit this for a few months. Find the relevant
conversation here:
https://lore.kernel.org/netdev/20220913155408.GA3802998-robh@kernel.org/

Can we directly apply this series?

I based this off at the current soc/soc.git soc/dt (2d5e7e2a3db5). Let me
know if there’s another tree that’s got newer DT changes.

Here's how I did it, for the interested (or suggestions):

Find the platforms which have got 'label = "cpu";' defined.
grep -rnw . -e 'label = "cpu";'

Remove the line where 'label = "cpu";' is included.
sed -i /'label = "cpu";'/,+d arch/arm/boot/dts/*
sed -i /'label = "cpu";'/,+d arch/arm64/boot/dts/freescale/*
sed -i /'label = "cpu";'/,+d arch/arm64/boot/dts/marvell/*
sed -i /'label = "cpu";'/,+d arch/arm64/boot/dts/mediatek/*
sed -i /'label = "cpu";'/,+d arch/arm64/boot/dts/rockchip/*
sed -i /'label = "cpu";'/,+d arch/mips/boot/dts/qca/*
sed -i /'label = "cpu";'/,+d arch/mips/boot/dts/ralink/*
sed -i /'label = "cpu";'/,+d arch/powerpc/boot/dts/turris1x.dts
sed -i /'label = "cpu";'/,+d Documentation/devicetree/bindings/net/qca,ar71xx.yaml

Restore the symlink files which typechange after running sed.

Arınç ÜNAL (5):
  dt-bindings: net: qca,ar71xx: remove label = "cpu" from examples
  arm: dts: remove label = "cpu" from DSA dt-binding
  arm64: dts: remove label = "cpu" from DSA dt-binding
  mips: dts: remove label = "cpu" from DSA dt-binding
  powerpc: dts: remove label = "cpu" from DSA dt-binding

 Documentation/devicetree/bindings/net/qca,ar71xx.yaml      | 1 -
 arch/arm/boot/dts/armada-370-rd.dts                        | 1 -
 arch/arm/boot/dts/armada-381-netgear-gs110emx.dts          | 1 -
 arch/arm/boot/dts/armada-385-clearfog-gtr-l8.dts           | 1 -
 arch/arm/boot/dts/armada-385-clearfog-gtr-s4.dts           | 1 -
 arch/arm/boot/dts/armada-385-linksys.dtsi                  | 1 -
 arch/arm/boot/dts/armada-385-turris-omnia.dts              | 1 -
 arch/arm/boot/dts/armada-388-clearfog.dts                  | 1 -
 arch/arm/boot/dts/armada-xp-linksys-mamba.dts              | 1 -
 arch/arm/boot/dts/at91-sama5d2_icp.dts                     | 1 -
 arch/arm/boot/dts/at91-sama5d3_ksz9477_evb.dts             | 1 -
 arch/arm/boot/dts/bcm-cygnus.dtsi                          | 1 -
 arch/arm/boot/dts/bcm4708-buffalo-wzr-1166dhp-common.dtsi  | 1 -
 arch/arm/boot/dts/bcm4708-luxul-xap-1510.dts               | 1 -
 arch/arm/boot/dts/bcm4708-luxul-xwc-1000.dts               | 1 -
 arch/arm/boot/dts/bcm4708-netgear-r6250.dts                | 1 -
 arch/arm/boot/dts/bcm4708-smartrg-sr400ac.dts              | 1 -
 arch/arm/boot/dts/bcm47081-buffalo-wzr-600dhp2.dts         | 1 -
 arch/arm/boot/dts/bcm47081-luxul-xap-1410.dts              | 1 -
 arch/arm/boot/dts/bcm47081-luxul-xwr-1200.dts              | 1 -
 arch/arm/boot/dts/bcm4709-netgear-r8000.dts                | 1 -
 arch/arm/boot/dts/bcm47094-asus-rt-ac88u.dts               | 3 ---
 arch/arm/boot/dts/bcm47094-dlink-dir-885l.dts              | 1 -
 arch/arm/boot/dts/bcm47094-linksys-panamera.dts            | 4 ----
 arch/arm/boot/dts/bcm47094-luxul-abr-4500.dts              | 1 -
 arch/arm/boot/dts/bcm47094-luxul-xap-1610.dts              | 1 -
 arch/arm/boot/dts/bcm47094-luxul-xbr-4500.dts              | 1 -
 arch/arm/boot/dts/bcm47094-luxul-xwc-2000.dts              | 1 -
 arch/arm/boot/dts/bcm47094-luxul-xwr-3100.dts              | 1 -
 arch/arm/boot/dts/bcm47094-luxul-xwr-3150-v1.dts           | 1 -
 arch/arm/boot/dts/bcm47189-tenda-ac9.dts                   | 1 -
 arch/arm/boot/dts/bcm53015-meraki-mr26.dts                 | 1 -
 arch/arm/boot/dts/bcm53016-meraki-mr32.dts                 | 1 -
 arch/arm/boot/dts/bcm953012er.dts                          | 1 -
 arch/arm/boot/dts/bcm958622hr.dts                          | 1 -
 arch/arm/boot/dts/bcm958623hr.dts                          | 1 -
 arch/arm/boot/dts/bcm958625hr.dts                          | 1 -
 arch/arm/boot/dts/bcm958625k.dts                           | 1 -
 arch/arm/boot/dts/bcm988312hr.dts                          | 1 -
 arch/arm/boot/dts/gemini-dlink-dir-685.dts                 | 1 -
 arch/arm/boot/dts/gemini-sl93512r.dts                      | 1 -
 arch/arm/boot/dts/gemini-sq201.dts                         | 1 -
 arch/arm/boot/dts/imx51-zii-rdu1.dts                       | 1 -
 arch/arm/boot/dts/imx51-zii-scu2-mezz.dts                  | 1 -
 arch/arm/boot/dts/imx51-zii-scu3-esb.dts                   | 1 -
 arch/arm/boot/dts/imx53-kp-hsc.dts                         | 1 -
 arch/arm/boot/dts/imx6dl-yapp4-common.dtsi                 | 1 -
 arch/arm/boot/dts/imx6q-b450v3.dts                         | 1 -
 arch/arm/boot/dts/imx6q-b650v3.dts                         | 1 -
 arch/arm/boot/dts/imx6q-b850v3.dts                         | 1 -
 arch/arm/boot/dts/imx6qdl-gw5904.dtsi                      | 1 -
 arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi                    | 1 -
 arch/arm/boot/dts/imx6qdl-zii-rdu2.dtsi                    | 1 -
 arch/arm/boot/dts/imx6qp-prtwd3.dts                        | 1 -
 arch/arm/boot/dts/imx7d-zii-rpu2.dts                       | 1 -
 arch/arm/boot/dts/kirkwood-dir665.dts                      | 1 -
 arch/arm/boot/dts/kirkwood-l-50.dts                        | 1 -
 arch/arm/boot/dts/kirkwood-linksys-viper.dts               | 1 -
 arch/arm/boot/dts/kirkwood-mv88f6281gtw-ge.dts             | 1 -
 arch/arm/boot/dts/kirkwood-rd88f6281.dtsi                  | 1 -
 arch/arm/boot/dts/mt7623a-rfb-emmc.dts                     | 1 -
 arch/arm/boot/dts/mt7623a-rfb-nand.dts                     | 1 -
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts              | 1 -
 arch/arm/boot/dts/mt7623n-rfb-emmc.dts                     | 1 -
 arch/arm/boot/dts/orion5x-netgear-wnr854t.dts              | 1 -
 arch/arm/boot/dts/qcom-ipq8064-rb3011.dts                  | 2 --
 arch/arm/boot/dts/r9a06g032.dtsi                           | 1 -
 arch/arm/boot/dts/stm32mp151a-prtt1c.dts                   | 1 -
 arch/arm/boot/dts/sun7i-a20-lamobo-r1.dts                  | 1 -
 arch/arm/boot/dts/vf610-zii-cfu1.dts                       | 1 -
 arch/arm/boot/dts/vf610-zii-dev-rev-b.dts                  | 1 -
 arch/arm/boot/dts/vf610-zii-dev-rev-c.dts                  | 1 -
 arch/arm/boot/dts/vf610-zii-scu4-aib.dts                   | 1 -
 arch/arm/boot/dts/vf610-zii-spb4.dts                       | 1 -
 arch/arm/boot/dts/vf610-zii-ssmb-dtu.dts                   | 1 -
 arch/arm/boot/dts/vf610-zii-ssmb-spu3.dts                  | 1 -
 arch/arm64/boot/dts/freescale/imx8mm-venice-gw7901.dts     | 1 -
 arch/arm64/boot/dts/freescale/imx8mp-venice-gw74xx.dts     | 1 -
 arch/arm64/boot/dts/freescale/imx8mq-zii-ultra.dtsi        | 1 -
 arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtsi   | 1 -
 arch/arm64/boot/dts/marvell/armada-3720-turris-mox.dts     | 2 --
 arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts       | 1 -
 arch/arm64/boot/dts/marvell/armada-8040-clearfog-gt-8k.dts | 1 -
 arch/arm64/boot/dts/marvell/cn9130-crb.dtsi                | 1 -
 arch/arm64/boot/dts/mediatek/mt7622-bananapi-bpi-r64.dts   | 1 -
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts               | 1 -
 arch/arm64/boot/dts/mediatek/mt7986a-rfb.dts               | 1 -
 arch/arm64/boot/dts/mediatek/mt7986b-rfb.dts               | 1 -
 arch/arm64/boot/dts/rockchip/rk3568-bpi-r2-pro.dts         | 1 -
 arch/mips/boot/dts/qca/ar9331.dtsi                         | 1 -
 arch/mips/boot/dts/ralink/mt7621.dtsi                      | 1 -
 arch/powerpc/boot/dts/turris1x.dts                         | 2 --
 92 files changed, 100 deletions(-)


