Return-Path: <SRS0=o35/=NH=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6036BC4338F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 21:22:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2256D60F11
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Aug 2021 21:22:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2256D60F11
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+vYJnwyUh3gnAZRe5xvjszqnWO+H5IWQbkHRP41CahI=; b=O5GsXoXF2aopGR
	EQM2xJb/JBSjtph708TQXqdEBn1hmIFEg+QYFO8+TKoi1IjAT8zx5C0+a12L7vSCNNaTpte9Ty9EG
	i78VW/UZ2nB/+k0l3OsACSbILZYOaxmyZ3Ca6eonY78QXhaoZA9OppTa1GCX2UUqtiLi6mz80fN+U
	XNjB7Fz9sAsoze0YLn/1fCGdOv8H3X47NWMEMKK8SH5FXsEiGdp3RYUGNbUryYn9z1LZU5slFuMZu
	VtPJVhYNgLaigpTBRkvTeeDWoh4qK82eAGk0aw5NzPBlRPvCFJxID+uo9hORRGFlYh2QeLtZJdxA4
	a6XGBVxDIoqW/c+7kapQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mFk2a-000KMx-4Y; Mon, 16 Aug 2021 21:21:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mFk2U-000KLW-Nq
 for linux-arm-kernel@lists.infradead.org; Mon, 16 Aug 2021 21:20:59 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E2B5C60C3F;
 Mon, 16 Aug 2021 21:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629148858;
 bh=xy75B7f3O3rr1HsJ4TIPFeo8h1e6BjPN9GfOsaopMQ0=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Qeo3TZ0As32pZKsH9KiwU5xtTfHLQJcOlZ+jbj+9k3TFmMuHJ9P464WR2LZk76n0k
 7MAmD4jeikhnxSTOzGRtKH6uJbV6KpsMqsUHsdjnwi1ykd3KPKMmEv8JuKPdPAvW5o
 RuvQA8voWVcKTeMWray3r9oEesOwGjzyDNAi9WLxIG1defnNVppZO+L2ojbm68qg8t
 ugb0FWrEo8+UR1Be3DWpT7Mnr63HyDdfqZMGwa3Ym4oX/WhcVtOSndR10eN8yHhBK8
 6jW3hceoV1LfpenUQ72u6jTjwwMWPoTIR9AlOv6ayRw+w/Sacvkkup2OG1t0/A9zYu
 45komE6TwXmyg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 soc <soc@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [GIT PULL 1/2] Renesas ARM DT updates for v5.15 (take two)
Date: Mon, 16 Aug 2021 23:20:48 +0200
Message-ID: <162914852219.237905.10683958407915595103.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1628849623.git.geert+renesas@glider.be>
References: <cover.1628849621.git.geert+renesas@glider.be>
 <cover.1628849623.git.geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210816_142058_844070_9F942FD0 
X-CRM114-Status: UNSURE (   6.85  )
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
Message-ID: <20210816212048.n3fSHVCuVwZTheK8lN7LDryA96x8-mSsbm_GpgprQ0Y@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 13 Aug 2021 12:22:35 +0200, Geert Uytterhoeven wrote:
> The following changes since commit 651f8cffade8615bb4fce1ecb3a929892c5e60d7:
> 
>   arm64: dts: renesas: r8a77961: Add iommus to ipmmu_ds[01] related nodes (2021-07-30 15:07:25 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-dt-for-v5.15-tag2
> 
> [...]

Merged into arm/dt, thanks!

merge commit: d5aa0245860732268b94d9989e2ade382770fd13

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
