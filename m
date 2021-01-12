Return-Path: <SRS0=gmZ6=GP=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27350C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Jan 2021 13:58:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3A2622B30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Jan 2021 13:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3A2622B30
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ti.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LCkDdwZTmB+toT//w/65Lwa6h8po0cTZwfPRmRRPCjc=; b=XHFTp9a5dR8LXbey03NhhX9hh
	WrorRpKbNJfvyBAWTe2ShAjFhLVdicq5c6MGRaWKjwLE8L3AInE4lNqhfQICM3l8Q2GKIALuUxyFa
	OQiRnkmNH1kjHC7N7n5y56v8kMqdp4a8K7yEzLUdcMq+2hxCwTP1aYKhdZXJ9iMLxnGWdIn0+o/P5
	RiLlQxgjNS2sFAI2Va6luyLY2X4PJYKiyor3LThbXYMTysfDD4OCHrLVVCJDdSCaZEVEZSO7LAjUE
	Q6KcbQjVj5ZxvVz+9ZxqEPah0bn++xJtin57JhZDwA/VR5UYXFuFkp5/r27k63FiHky8ZJQHI0zPH
	e6Se4RTyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzK9q-0006dd-LR; Tue, 12 Jan 2021 13:56:26 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzK9I-0006Qm-DP
 for linux-arm-kernel@lists.infradead.org; Tue, 12 Jan 2021 13:56:09 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 10CDtfWZ076642;
 Tue, 12 Jan 2021 07:55:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1610459741;
 bh=OAyPA6z9ikgZ1vPPSEge+i7syzFzsS9b3mIxvoCVb34=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=Jzwzc2Sm8/r3TzGG5fieMUR4kzMjSKhKZiJ4QPp14CjHbMxRsmBJn/CnyFJkaF/Xh
 D+sJ5KlVgDtKB5Z9bmygotbvQbguQLlBFBCZbnAnVAhY8H6APXwLRaA5sjLbGucJ6S
 K3Fjlb2YvRlr4Der9mD1kDJHVx2rLW6iTHZimpbw=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 10CDtecq071677
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 12 Jan 2021 07:55:41 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 12
 Jan 2021 07:55:40 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 12 Jan 2021 07:55:40 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 10CDteBh098573;
 Tue, 12 Jan 2021 07:55:40 -0600
From: Nishanth Menon <nm@ti.com>
To: <linux-kernel@vger.kernel.org>, Tero Kristo <kristo@kernel.org>
Subject: Re: [PATCH] MAINTAINERS: Update my email address and maintainer level
 status
Date: Tue, 12 Jan 2021 07:55:39 -0600
Message-ID: <161045957072.21611.7195965911464128734.b4-ty@ti.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201217130721.23555-1-t-kristo@ti.com>
References: <20201217130721.23555-1-t-kristo@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_085552_794971_8A25E39A 
X-CRM114-Status: GOOD (  14.27  )
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
List-Id: <soc.lore.kernel.org>
Cc: Nishanth Menon <nm@ti.com>, Tony Luck <tony.luck@intel.com>,
 Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 SoC <soc@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 linux-arm <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210112135539.h7H2bIz_J4uuYGsChZ304SaTH--Orw_DVL4PE5E7Q7o@z>

On Thu, 17 Dec 2020 15:07:21 +0200, Tero Kristo wrote:
> My employment with TI is ending tomorrow, so update the email address
> entry in the maintainers file. Also, I don't expect to spend that much
> time with maintaining TI code anymore, so downgrade the status level to
> odd fixes only on areas where I remain as the main contact point for
> now, and move myself as secondary contact point where someone else has
> taken over the maintainership.

Hi Tero Kristo,

I have applied the following to branch ti-k3-maintainer-next on [1].
Thank you!

[1/1] MAINTAINERS: Update my email address and maintainer level status
      commit: 2672b94d730c4b69a17ce297dc3fa60b980e72dc


All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent up the chain during
the next merge window (or sooner if it is a relevant bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Original patch reference [2].

[1] git://git.kernel.org/pub/scm/linux/kernel/git/nmenon/linux.git
[2] lore.kernel.org/r/20201217130721.23555-1-t-kristo@ti.com
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
