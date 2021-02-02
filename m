Return-Path: <SRS0=E8YZ=HE=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0045C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 07:16:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9305764DAE
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Feb 2021 07:16:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9305764DAE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XxCftMeCF2wvgQ6oFmw5v621AQVuoRhE931nL6MlA1w=; b=zxerv1YGgN8c5BW589FaXrpTo8
	i1WZkBHE1z72NR5+TGCkTrSkauLLS6DJgXrYHwQ/+r0bjUQz42W5x+Jn+suK2CnIChDQz2M//IFsH
	ojb8mEH4yoCKj1p8/mMp/plI1LuuCOYoL1uYJIkOZwmdIEQu8dE5xQOFfI3ad7v5baVmHbFaZcpGt
	1h27IE6h5xzG+3rosBwzJE05h738WS5BibFSfhnhv8cAxA9bJk+XGO4NHwufqi14fMKPFKsrrzx3S
	aIw6tY72sgsAdYO77zp6TIgH3Kef/t0Nsg+86eShwYXhXQnQbxU8ZZRehO2k4b1Jj54JeXQmpTuFS
	nIFAhxzw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6pto-00042n-Vq; Tue, 02 Feb 2021 07:14:57 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6ptk-00042K-13
 for linux-arm-kernel@lists.infradead.org; Tue, 02 Feb 2021 07:14:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 476B364D79;
 Tue,  2 Feb 2021 07:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612250089;
 bh=NFNhDtlb8eZNwzo/6X/YBxeINQzVN1WTGm3v6pwchb4=;
 h=Date:From:List-Id:To:Cc:Subject:From;
 b=ihJrMNcF7P6nw6EJrd945sLSh3prkSTDMYVDFVZBz5PiXJOCcrkKKCoB4p+WBfOm4
 /ZSHy8SLNhGzh9dWmxXKOTEYyudmyPF6yZNJjvN3z6HVozasHvzORosOh6vbpfahCz
 4LwDdgynT6FjxNaaqg25cWtsDEvGo8mTNLRORe6ujwYm/3p3lj1156QB+mj6YIQ68p
 1I6P8IvtdBHXPlP1DltjEMpzuIrfstQ/s8RlJdFrNtrNST+y+fTp9nh5jDGp4C828E
 Q3T4S7BgA9T8fipEONPwtA456d1F0IG+y36EU+H5iR3MRi5nXCBfTKuNofGR7pTpPA
 8HV0KQay0IYxQ==
Date: Tue, 2 Feb 2021 15:14:42 +0800
From: Shawn Guo <shawnguo@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org, arm@kernel.org
Subject: [GIT PULL] i.MX fixes for 5.11, round 3
Message-ID: <20210202071441.GP907@dragon>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_021452_165396_E05D5B81 
X-CRM114-Status: UNSURE (   8.81  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>, 
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Stefan Agner <stefan@agner.ch>, Li Yang <leoyang.li@nxp.com>,
 linux-imx@nxp.com, kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210202071442.rAFWdjquIxL9vf62qMKrDm80kZ0jRMhStNouLxdzboQ@z>

The following changes since commit 82c082784e03a9a9c043345f9bc04bc8254cf6da:

  firmware: imx: select SOC_BUS to fix firmware build (2021-01-18 15:49:07 +0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.11-3

for you to fetch changes up to aa880c6f3ee6dbd0d5ab02026a514ff8ea0a3328:

  arm64: dts: ls1046a: fix dcfg address range (2021-01-30 21:28:23 +0800)

----------------------------------------------------------------
i.MX fixes for 5.11, round 3:

- Fix DCFG address range on LS1046A SoC.

----------------------------------------------------------------
Zyta Szpak (1):
      arm64: dts: ls1046a: fix dcfg address range

 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
