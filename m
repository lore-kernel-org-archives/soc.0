Return-Path: <SRS0=+LcQ=PI=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EEB8C433F5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 15:13:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2650961354
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Oct 2021 15:13:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2650961354
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BzytijYDADOBJ212cLs+Q/3/vDxJZSe4ZDxGuvhxTZ0=; b=zIBkheYsPj+jAs
	8IOehk5k4a4g8TWYd6WDNt/wUaXLySjTdWtFAhjTbRQq9eboHHBnhajyiUklNJVcokvhbXO9NB3Kc
	J40e9vLpwn+dhv/Ket8UYE9oD465bfMmzo0mBjaduTAEHLGz6ATWMZPfj5GEuyxy84DDGdC8rfdbN
	0ggAAcmdQJ1S91nWig5NQnqe0O9LABpf5l/YWNnJ81ZM42ey96hBOHwBd5sgsCUXWl+uyLLKC5wAZ
	LFJN0s5VtLLz5KHQaQ25ujNB9ViiqAYaqFUa/BwBoVco0JhK2VG4UR7ObjES/himxFWpaWJ6rgo28
	BplXjk+1tEw8rc0yypDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdDFF-004vRk-Po; Wed, 20 Oct 2021 15:11:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdCva-004q5R-FM
 for linux-arm-kernel@lists.infradead.org; Wed, 20 Oct 2021 14:50:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 358DC610A1;
 Wed, 20 Oct 2021 14:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634741450;
 bh=Z5+UTrR17kZse33IBvH6TAo2pcZtD+hXyaksbzLQJy4=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iI7W7qANHi8ewOG70L/ICmUTlG4FD8eTBcn+xb8p0Pr3ql9qk2Jm4YQVWnvjyT4+s
 BXI2I1KtepMoVESXW8Yj/KrW1Jr6dRUTMMTCPY1+suKAz4Horbqd6awxc6d/hzuYyC
 +TmXDUVEzBX9yyULKlp4pf1WE7Cf7ewQhCfzgeQ4Bxf8Fc8PEIdrKvxU8o5TV6R6XB
 Gs15uNt8OeuOaWO0rXnMSLfAbzt6uqbqM+tTxeFwINW84eTjLSpwUCXFrKdjAitwCU
 bazAlCwLx9jyYki3Kk/gG//rn6vMRHYn9Yx5XCuc29FBDqxmnrTQ2O0E0oJbjHacd9
 mwsgnklpw9Jdg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Shawn Guo <shawnguo@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-imx@nxp.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
 Stefan Agner <stefan@agner.ch>, Li Yang <leoyang.li@nxp.com>
Subject: Re: [GIT PULL 1/6] i.MX DT bindings update for 5.16
Date: Wed, 20 Oct 2021 16:50:18 +0200
Message-ID: <163474139787.4099414.8954767744128108224.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211016140138.1603-1-shawnguo@kernel.org>
References: <20211016140138.1603-1-shawnguo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_075050_589524_6854AB0A 
X-CRM114-Status: UNSURE (   6.07  )
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
Message-ID: <20211020145018.4rM5Seci9EZIcxE6jtcdoeo-qld-CPZ2LTGwuZGgpN4@z>

From: Arnd Bergmann <arnd@arndb.de>

On Sat, 16 Oct 2021 22:01:33 +0800, Shawn Guo wrote:
> The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:
> 
>   Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-bindings-5.16
> 
> [...]

Merged into arm/dt, thanks!

merge commit: 353bbb3d07e836738869a74e23f2deba0a34aa80

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
