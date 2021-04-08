Return-Path: <SRS0=Q2eW=JF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C793EC433ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 20:01:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68F1E610E6
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 20:01:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68F1E610E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cnSRP0TkRJ1PCfXwQfjgAuY8NqW7YHPrTSANwQVTdqY=; b=PvaiD0/shtLJMfz7azXM26vya
	Hw7CQyZYFjeHHaR65TXD90YUR4pyZpwHcp60E3aT1uqeLynCG0xw7CygirXArtSPd5SFxmWXqVHrs
	MLwBAGQ0IBb/O4lXZHkNv8DsDe1LS6qcJkHV0qbKeCIjy2bXYihLgdmOooVG204bqogld1Cb33mE1
	0S4tmcocu5g7l8XFk6wxcnErIHGPXd1K5h1Gpf6nMz2wOeaZtGkGwktyW1HGvDtybgOPYgwJd1OIh
	uIozJGRTfffRcQgqCqEp/WDXehKKEY/aODzmvWi4EjkPFeF28hRev3650ytuzJS3oyH40XG2aFC3c
	9DU00I8Hw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUaoT-00996A-U6; Thu, 08 Apr 2021 19:59:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUaoP-00994w-7L
 for linux-arm-kernel@lists.infradead.org; Thu, 08 Apr 2021 19:59:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 219CB610E6;
 Thu,  8 Apr 2021 19:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617911969;
 bh=4es+1KMoU9lNNgg1FIobUbBgL3zReVBM1s+0Xrvnwb4=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NshXC+XhVTUtR3Z4zXIvNZgI/K2MGb7xMf2cZbnCaiNRo/KGqm7gRwaG7SRBlTx4y
 KE9ex99Uw0y7Qb/0rRO8os5381iL1alUtsig2FIPADpDvNyB4LhArk9iq5nRiFTEpj
 jmyseoSoVuWMjXIhoGVquA9mx9pob1hI1mmrDOKeaXR0QHf5AOnL+UBCyhwiYY+r2u
 siMgmtlQrwH8sqS6VLO2o8821C00chFdbWl5t0CRos3ycMUTg8mSe0TSOgcy7ZHzbl
 hS2+0+eSlVPnacnSbHgvEjscPNo4TaFXlf8lpJ8Fqfcp0DTYey9s5mSAXK3GnG7uyW
 a8w6b+cKfj56Q==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Tony Lindgren <tony@atomide.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org, arm@kernel.org
Subject: Re: [GIT PULL] Few more fixes for omaps for v5.12-rc cycle
Date: Thu,  8 Apr 2021 21:59:06 +0200
Message-ID: <161791193691.1658989.4646630397638417333.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1617702755-711306@atomide.com>
References: <pull-1617702755-711306@atomide.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_205934_462274_C4A7240B 
X-CRM114-Status: UNSURE (   6.39  )
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
Message-ID: <20210408195906.QZfVxwQzKPB0rQR_u4SO-hqYC88yDvDqk8m2fVNunXk@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 6 Apr 2021 12:53:49 +0300, Tony Lindgren wrote:
> The following changes since commit b3d09a06d89f474cb52664e016849315a97e09d9:
> 
>   ARM: OMAP4: PM: update ROM return address for OSWR and OFF (2021-03-17 15:15:52 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.12/fixes-rc6-signed
> 
> [...]

Merged into arm/fixes, thanks!

merge commit: b9a9786a13ea158ee3b23614217f2e3158178421

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
