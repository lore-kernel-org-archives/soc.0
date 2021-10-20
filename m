Return-Path: <SRS0=+LcQ=PI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16BDAC433F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 21:21:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1A16611ED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 21:21:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D1A16611ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P5q1UzS+7LnQFRLZ+eNKzUT8yfLX6QlRvI1gQYsmveo=; b=p7frO9n6Dd3u2R
	S5eEm+StIzh2hC/glWLaMOIh4u232e8u9bsJHZUQCUMXhR2ysj/M+6DrqGBowwhMnqHwZV0sPYBkK
	ItdKln7hqZHqpTnHYczdyyCMbKFAttJ3R+zQxhiSbG9j8nYdjYD5fJu7BDcVyuDV+IvnFMd45JGoP
	p9UUR69mwiV4Vp2GlUmnyrc2lOqfGd8MW2mQzCiETHA3/zCklgUge0uUAzhIr2qcEY9bSJK9jUdv6
	AUyc4TPJXYdZdl9r8UGKFjjnk6KJGrpYHziwptRp9fNYb3y9huKPU/Gbu0VXXfGtjgq8WZ7tLB+Rn
	CMqoRvM+cx4T7tiWy/pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdJ0N-005p7J-7H; Wed, 20 Oct 2021 21:20:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdJ06-005p4Y-RJ
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Oct 2021 21:19:56 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3CAFA60F9F;
 Wed, 20 Oct 2021 21:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634764794;
 bh=2Jimqf62uqwLSWFpV7vLK0iL7jLLoW97SEoCDR+thas=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kNh69Wjpu0+M19ggaEmGVqkZl0lYLIGTE8UEbECLgFRzJTYn357RRCwRPpku8Q/vs
 SHkVN0ko+VcvHhDTUQoC7DPCdciOl3HKVRT3QqSg3VVnqipxusJO+Xz3wdCt3Pkbh8
 gSZx6Lti1p9d+etoG/K1ABk5pq4f8aoJajwzqk9ZXn1BK+ydEs/labgssDjNAbBnRP
 wikBGJN+ntx40fFmWSJn7Ag+iWqo2SGow860SeJlv8G/8dRJ9mf7zqO2Y+fMKFR2Mp
 LIAizoeZBM2bv9tjf+QZZ20n0NkWMjyPblVx0bIZZCJPFbbHhFWdRRvww/Q4GxlXb8
 L1Ad9JwWvvnww==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: Tony Lindgren <tony@atomide.com>,
	soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 arm@kernel.org, linux-omap@vger.kernel.org
Subject: Re: [GIT PULL] GPMC changes for omaps for v5.16
Date: Wed, 20 Oct 2021 23:19:48 +0200
Message-ID: <163476478090.3883860.7844960707837350375.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1634280279-284035@atomide.com>
References: <pull-1634280279-284035@atomide.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_141954_955001_7008C9AD 
X-CRM114-Status: UNSURE (   6.63  )
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
Message-ID: <20211020211948.H3Vq60kA7qSB7yYU3m4Z6te_VderoU8P9V4LPZWIhZA@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 15 Oct 2021 09:45:14 +0300, Tony Lindgren wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.16/gpmc-signed
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 9f2feb32c2b6a39fdf8c872486341ffa84b2eff5

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
