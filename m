Return-Path: <SRS0=ftTf=GS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8635CC433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 17:24:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 43C472343B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 17:24:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 43C472343B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ofucWh5CucKSkfl5zN+G5KWGK6N51hbyolp98kf+MjY=; b=MB8lXLe0CbFcT2OpwRaPBAHjc
	Wwx+fNZ5G2/F5fznDzR4Bo8R3bFj/mwscZ/qvGiABGUfnl6mqprxQQ8VQLgUZAC8+j3EWXpeIIDBp
	59S2VZueOpS90By3U1m9bJxSdov/wvOs5aLZD7jtaylpFsMBPllGl+hZvcHQ28bSFN44HxrnigO+u
	Gc+6tM0LDI/U5U6EDLoNjhAaYF5atqLlscEEUh0OfqRpcHOCfkz9GzKcYzYbmex2XVZ7L62QkgQUL
	6mKVl8HOKcxSjTM3gsPHojLW9EpCJJEx381KdsxZIptR180b3GTncgqzgYF2ke+3MTe3Tlg57kb3w
	EifnxcA1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0SoO-0004gJ-Ta; Fri, 15 Jan 2021 17:23:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0Snn-0004Tv-MH
 for linux-arm-kernel@lists.infradead.org; Fri, 15 Jan 2021 17:22:25 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F3011238EF;
 Fri, 15 Jan 2021 17:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610731341;
 bh=LQUALLwkBoNXuhpX3P0C6NQaVxjVhzCX44EHH7FgXVg=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sWGUsul4n+NYYQXTDOBB9BZpHnSU7nBJWEYe3aIO9x5DYWmsTE2Uqqf7ywAqKftlQ
 3jB0GbsUAg7+baP2enHjDNlwEjEpuImnJxgkSwq/2KqtO1oWd/JHMo0o60it6yguvp
 dsZ6E6cUl189+VrVusKxe0IUB7PG/gpltYpUCq5cSqaxf4Tjh8nsmH8CMZ2NTOAz8b
 Clx/RTOpx2sNhpneOBfBpUkU2+07hSoXct5Kgj8IBcgIqEkFuLoMiA9CzquVvsuzPJ
 sh5sJAZbmC8yFG8YBJ3MgQIkZhnReEWoJ2imjWi3d6i9j/JmwEhixBrc+efuLLkCNl
 mo8f3mNBwTKdg==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	arm@kernel.org,
	Shawn Guo <shawnguo@kernel.org>
Subject: Re: [GIT PULL] i.MX fixes for 5.11
Date: Fri, 15 Jan 2021 18:22:09 +0100
Message-ID: <161073123833.625238.16853380161036943595.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112131224.GI28365@dragon>
References: <20210112131224.GI28365@dragon>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_122223_953641_24887F72 
X-CRM114-Status: UNSURE (   8.64  )
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
Cc: Arnd Bergmann <arnd@arndb.de>, Stefan Agner <stefan@agner.ch>,
 Li Yang <leoyang.li@nxp.com>, linux-imx@nxp.com, kernel@pengutronix.de,
 Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210115172209.CDt4R5JbJXr8olo7je1O-WXBkhMuDRPSzS14wHxKFdU@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 12 Jan 2021 21:12:25 +0800, Shawn Guo wrote:
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
> 
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-fixes-5.11
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: 8880bf6de400346600cb334f236cce924558690f

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
