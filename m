Return-Path: <SRS0=+UL9=NQ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 555DDC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Aug 2021 07:31:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 237B560EFE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Aug 2021 07:31:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 237B560EFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:
	From:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8ueyT4ZsAtKE+E51N05PnWadnwPFMGNbMNJ/x8QnhA0=; b=GSNBmFUT3jrk/n
	u0h+QGvhqZ1Sy0Z3jnXymnq/qWJ6paHGMBDSD9ZfFxxviuc3JlxroHcAvYohGVPTZn1oCE3O/rJPc
	aiv/FDWs0uhzhAy/vEBcev1oZqPpnJC8rUP+vOsyu9NGOk1TrUn0xXoamSx9LzMKXx1s1/qErcdYz
	g0vDgk8/xjtFUbs8JJARUiJ6B8Nc1nVmhDFZbI0xIsknbTQgtORw+nGUnVzB507eVfZvfed2IZq4k
	vIopdX/l9eogPCbc4LvGNR4/xQ+dWe4KLiLtgSoR6uR7cOFzhqtS6+JRnG4KEUhw0OTsrAIWiIuef
	BEsfHlp/89s10+ErZuGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mInLM-005oX8-H8; Wed, 25 Aug 2021 07:29:04 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mInLG-005oWK-AZ
 for linux-arm-kernel@lists.infradead.org; Wed, 25 Aug 2021 07:29:02 +0000
Received: by mail-ej1-x62e.google.com with SMTP id lc21so17164190ejc.7
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 25 Aug 2021 00:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=monstr-eu.20150623.gappssmtp.com; s=20150623;
 h=to:cc:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=EWkv2LY4ATYPWVUsgzFkn/MR1kSUr3gSJNpViVJ9w2g=;
 b=MXhkijdXuekbIWw615VyzNQ8aLwUnZKOxWrp3lVywq9GjnMwcHZE7lrRaC2XN0i1st
 XON0UatRG/BLPxGzQ9A7UgFmo+OBiLUfoQi9hfu+5WY7h7jrOJQp2T30fFyrH1elBNZc
 UfmydetaBDObN/Rb4rnqEv8a7laJEWiVCHAgKNyzHfAjoGwnU88/RbsOzt1gSjFKBPXY
 FAINQpXeDn9kJbZPa8ptwCxNdI5cLxbfEU8aRAYTNyW+h0P6/SRg0HdMb7KfnxDxbbNI
 XjTvx2ihKVFANnnPyIBnzI888pH6yCfH+kc5UOZ+om5NAJOqxRqRV3/BN80kI0Ccm5XK
 mTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=EWkv2LY4ATYPWVUsgzFkn/MR1kSUr3gSJNpViVJ9w2g=;
 b=nfKot0vtgcsU++bxKGkT4beAZNAROcaxIPB1zMSki09jr3Ti0hq8SgK0oVUSARkEq1
 L7TquOXCkCRihKVB2ayhgijt4OYfGi6smQboXo8kYzoIQoMH/0++4/Plb/6jhv1GVwQG
 Gs4WR2UotwAQQPds+9l7n9ab41zMGzA6qnyW1agKUZhyOrKUB0PICVuTW3zputrPRpEF
 nLfgrvIiHRYQD405mU11Ih5Phv2QmsSV1Vkj9AhMyioLlztpaCbz5dz4WPC7+bajU/gb
 IosIkWiGk79MXT3aHaEYa2PlN17mT/xxxdVlKTVovsNmaDzcaVjj650PKhxNvvYvyXWM
 fbOg==
X-Gm-Message-State: AOAM5311jWYVOtYlbooNbZU3XVHjrDTodgXUPpKK6VSotxj5SOsTGhX6
 O53B3i6Np6s2DDR1VpHgtoL6uJkpZyhOUrxU
X-Google-Smtp-Source: ABdhPJx5sJVhqc6ZZhm+ZMukInZb9NG7LBF1Wt+ZH+SrbtAqaeeg1M48XOZYZDofUQ9cXWHULadQAg==
X-Received: by 2002:a17:906:6ad4:: with SMTP id
 q20mr46387480ejs.433.1629876536424; 
 Wed, 25 Aug 2021 00:28:56 -0700 (PDT)
Received: from ?IPv6:2a02:768:2307:40d6::e05? ([2a02:768:2307:40d6::e05])
 by smtp.gmail.com with ESMTPSA id b18sm4412707ejl.90.2021.08.25.00.28.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 00:28:56 -0700 (PDT)
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>
Cc: arm-soc <arm@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
From: Michal Simek <monstr@monstr.eu>
Subject: [GIT PULL] ARM: dts zynq: Xilinx DT changes for v5.15
Message-ID: <f3dc69c8-8a22-e938-4ddf-b1052b8c1437@monstr.eu>
Date: Wed, 25 Aug 2021 09:28:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210825_002858_472330_010675A5 
X-CRM114-Status: GOOD (  11.42  )
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
Message-ID: <20210825072855.SyNTZOHbrQUVoJU7COAksFxyrLBPW9SUp1-IwbRa2vo@z>

Hi,

please pull these two patches to your tree.

Thanks,
Michal

The following changes since commit e73f0f0ee7541171d89f2e2491130c7771ba58d3:

  Linux 5.14-rc1 (2021-07-11 15:07:40 -0700)

are available in the Git repository at:

  https://github.com/Xilinx/linux-xlnx.git tags/zynq-dt-for-v5.15

for you to fetch changes up to c387eea58f931fe5d008df88cc75dfc3c704e3bf:

  ARM: dts: ebaz4205: enable NAND support (2021-08-06 12:22:40 +0200)

----------------------------------------------------------------
ARM: dts: Zynq DT changes for v5.15

- Enable nand flash controller for ebaz4205 board

----------------------------------------------------------------
Michael Walle (2):
      ARM: dts: zynq: add NAND flash controller node
      ARM: dts: ebaz4205: enable NAND support

 arch/arm/boot/dts/zynq-7000.dtsi    | 21 +++++++++++++++++++++
 arch/arm/boot/dts/zynq-ebaz4205.dts | 12 ++++++++++++
 2 files changed, 33 insertions(+)

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
