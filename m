Return-Path: <SRS0=xpWt=HN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36C0EC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Feb 2021 15:06:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD1A564F27
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Feb 2021 15:06:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD1A564F27
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FCzLxLInBLztefxNsA65z5f1rMmzUrGcQYrBwgKvO/A=; b=RmvOBbS28WgUYiiYgnX6xaUjD
	MhcHIudNqK6FahEdd9KKxYVYL68ZFQX8tpKkyGAsKDGLDPQBEpCiVmaUbudwu3GFHgCEmUOy81Vf+
	y9EKH2rgMHwIYLyz5+Wrttu+OMjmbSzZn2qWWb8aJWRR/NLmvhP39NPtRemkUGsUD19xQarT8z/80
	MaUj5nHWbx1PiusYu8KT5eJoj6UoiOCNe9bUbWmfF+DpcrelZ8tACMgolAIA3jToFvik4RWf8uPXN
	T2eXZd5cQDiORr+RInMGweiRP+2M5s+qu0MspdA3yqn2KBXRwEI4Io2zSzHR/FGOvRvWaiwVD4FJi
	xTme60txA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lADXJ-00067x-Go; Thu, 11 Feb 2021 15:05:41 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lADXD-00065X-Vw
 for linux-arm-kernel@lists.infradead.org; Thu, 11 Feb 2021 15:05:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D96F564F0A;
 Thu, 11 Feb 2021 15:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1613055935;
 bh=eMHR2QnFXKhzszOQbr8KEa6+kba6b6+zD2YeMMPU2wU=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nv4pieajO7AWDqObBnDXqECPGxxzdiYu2FrFRTEPbeKkyL60as6S/TyPVP9e+onWS
 +vJf72AszBN70JYQKpiuR1FGl3bKXA46Mi6TLLLaktImdEgIl8xhsbQm6GPBeB9bLA
 9r06I4gtNfJoZMVNLwcDnRUESbg6DS1zEf86dqIMM0ZMvgDKboBSZkqTh+OfMc2/sT
 hAeA04h4ovJrGXYxZcmeS9AnnAg+RlVB41g3X1NnpkpePb3/50KXpQTpLngbBJOSJt
 mYaMEcX/+mZkgSm7PxHgwWwW6VWVbQXvSUMZowcUUH8pOuL99kNdynLGstla3S3p+a
 +5t9JE3ZkPCVQ==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: SoC Team <soc@kernel.org>, arm <arm@kernel.org>,
 Joel Stanley <joel@jms.id.au>
Subject: Re: [GIT PULL] ARM: aspeed: soc changes for 5.12
Date: Thu, 11 Feb 2021 16:05:30 +0100
Message-ID: <161305590367.259551.3441332889006792758.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <CACPK8Xf+4VkWC6rkHhsWdwhaLjy2Az=GAHaEe=SvOiUc_OGKSQ@mail.gmail.com>
References: <CACPK8Xf+4VkWC6rkHhsWdwhaLjy2Az=GAHaEe=SvOiUc_OGKSQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_100536_145272_666CA901 
X-CRM114-Status: UNSURE (   9.34  )
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 linux-aspeed <linux-aspeed@lists.ozlabs.org>, Arnd Bergmann <arnd@arndb.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210211150530.n9vHwqXVXld8Kr7d1k0-3vv3FEvVE593F1yNOEmc0fo@z>

From: Arnd Bergmann <arnd@arndb.de>

On Wed, 10 Feb 2021 12:30:27 +0000, Joel Stanley wrote:
> A small pull request for the aspeed platform this time around.
> 
> The following changes since commit d0e72be77e7995923fac73f27cf7a75d3d1a4dec:
> 
>   soc: aspeed: socinfo: Add new systems (2021-02-10 22:25:45 +1030)
> 
> are available in the Git repository at:
> 
> [...]

Merged into arm/drivers, thanks!

merge commit: 4f79a8b06fccec3dd68935db5a4662435c472abf

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
