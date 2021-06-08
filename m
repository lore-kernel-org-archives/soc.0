Return-Path: <SRS0=9x2F=LC=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A3AAC47082
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jun 2021 12:30:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07BFB61287
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jun 2021 12:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07BFB61287
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rPbMOYrPszWkh88Fodu0Wyd7QCyMvKVNyf50GZh8rC4=; b=oWGPu62JkVMkfa
	gpDzNh37LHWWCUpWMXOk538BdcsbHMcpjSAJfi3fjXbsC3qo+eNeM3G6Q8cSrQQJCk931IM1QPQyR
	IJsF9fzRTzShwpAGS0NEjThT/BxFLIqgpbRiFAmi7GT2u41TOsoKF8JPvRsfACgJGGoxs2Fo9D+Fu
	95cTMaN3dPZWCX5nxetetRS58mTXYlQ+CrGsovTPK5megUMqB++5SgX5pKDwLGLZLLlo8QrWarAD5
	LkowvBx/SlZ4vP5zyV/oD2ZRJaKsXY2M+wTbPVOGoalfok98mAjJumZnxRaf567rcrytjjG+POqDk
	JQGdDX5qQb0p3Qykaz9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqaqJ-008LTR-FJ; Tue, 08 Jun 2021 12:28:28 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqaQJ-008Ate-FY
 for linux-arm-kernel@lists.infradead.org; Tue, 08 Jun 2021 12:01:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8803F6124B;
 Tue,  8 Jun 2021 12:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623153695;
 bh=10kEx6AcAb1DYOk5Z6m1G6xVwL5MwyY7cY33NxXwLrk=;
 h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
 b=SsQvAaGqZQb0LBQkPOgCYXgFcwAzPujSZ9KfEoKR2ol/qWGjWOO0/5QWAIV1Nby01
 ldU+xg2RfpyZ+zgoSh9GhsheHlKWppU6Id+1y2pL5i9xvqYExqOs87KOsxgxLr/7UW
 sbwdIBNinAwa1J3B+8/VlKzTDmQSTVMFEF5OqNE4kOJqiaDu5Yz3ZcK8r8C0HARXZG
 N/h6RlBfSY/yHUTuWvTzrp2NpBDYGmJHPYHwEl+xJlR81jnwMkii+oY9IXCq7uiKtC
 1BAqX28wPSxTAR+OKpRNiQwf/C4g0reY51q2Gu5B5gxseGadAbg5uYFvFL5UKfPO2q
 uXMooaZOHunxg==
Date: Tue, 8 Jun 2021 13:01:29 +0100
From: Will Deacon <will@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [GIT PULL] memory: Tegra memory controller for v5.14
Message-ID: <20210608120128.GB10174@willie-the-truck>
References: <20210607084910.21024-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210607084910.21024-1-krzysztof.kozlowski@canonical.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_050135_586334_A9D0990C 
X-CRM114-Status: UNSURE (   8.55  )
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
List-Id: <soc.lore.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, iommu@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, soc@kernel.org,
 arm@kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 Olof Johansson <olof@lixom.net>, Nicolin Chen <nicolinc@nvidia.com>,
 Dmitry Osipenko <digetx@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210608120129.JThDXfgi5-Jj9BOTK2hMYUlsJQy8jZus0OuEJH9kqKY@z>

Hi Krzysztof, Thierry,

On Mon, Jun 07, 2021 at 10:49:10AM +0200, Krzysztof Kozlowski wrote:
> Hi Thierry and Will,
> 
> This is the pull for you to base further SMMU aptches (prevent early SMMU
> faults).

This is a tonne of code for me to pull into the SMMU tree given that I only
want one patch!

Thierry, if I just stick:

https://lore.kernel.org/r/20210603164632.1000458-4-thierry.reding@gmail.com

on its own branch, can you stitch together whatever you need?

Will

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
