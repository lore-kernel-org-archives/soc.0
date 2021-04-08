Return-Path: <SRS0=Q2eW=JF=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,SUBJ_ALL_CAPS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E51C433B4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 20:22:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE5C561159
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Apr 2021 20:22:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE5C561159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+wrzbs4upw5wtW54kDt04CAGjCyY6B5/zfE4/b9WTVY=; b=KzDUTN+3ffEU7HULV3/hsGVbC
	VEQo3d9S24twhZD/e0QyPShM9+yTqen23gAWwY4N9VVGh0GlqhM2REuKvhQn+ea2+c0pxyL5KAOXW
	4U33WCzUUvnRna3+kJZPTjdfmAgBpQBIA+ua5vz3RqrvbuaRlKEB0Izwpi4DXaOZnzNGxlzQAsusC
	AEgkfLGSfx90WOvphnD4KRyDU2tZ19m9w4/isjuQsdjjo8a+5Am8g9lchhVdrJN4jmrJqVGDhLL/Y
	3Th1cH3Toe8G2lgjL3d2bB+ebfmBnzE1Q2pImoSwcQ6HvrxLyBJUhiiTjwyOJ+GC76DYdRB55dkrJ
	YS5W0MKnA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUb8v-009Byf-FP; Thu, 08 Apr 2021 20:20:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUb8m-009BxL-7y
 for linux-arm-kernel@lists.infradead.org; Thu, 08 Apr 2021 20:20:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 51C3161159;
 Thu,  8 Apr 2021 20:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617913235;
 bh=Ol4v7YNDLR8aNW/yj8HuDlxq+pgknT1KPgaXlcHNMB8=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hRGX3OIV2qmFI3/Y8vn0ePHMzdUSa448Gjc8yQFeY1kKqk6eCYaJcCo3JWQyWyrOj
 wqviZRY6KVOjnbm3k2knNg/iuDRWgdGMwbk8pdmc4C9GdBxsFIb1lCpLH6n8P3ZNft
 UUxDZMnxA3ezGLueNOkr8RbXhp5T38z69IFr/CEOdt80QKHXRcHmDO7X7Yi757qF06
 4Vxo/S0FzArPgbrlPirsM8IrjyghpjFLmAgcfUHZp34YmbD7Oh6cfUmLIrzl5KIOCC
 mKo9CGAkVRZ7SBL6mj/mAGuLQTScLQ2LF45JtXx6M7zlg2P/flRxRk8aYJKJXkSFyN
 W8HB23nuJw6YA==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org,
	Tony Lindgren <tony@atomide.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: Re: [GIT PULL 3/3]
Date: Thu,  8 Apr 2021 22:20:05 +0200
Message-ID: <161791320105.1663026.3535744727493035044.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <pull-1617703816-65652@atomide.com-3>
References: <pull-1617703816-65652@atomide.com>
 <pull-1617703816-65652@atomide.com-3>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210408_212036_803864_80591E42 
X-CRM114-Status: UNSURE (   6.59  )
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
Message-ID: <20210408202005.RU3PWY_qG1i6qOgUQFbIF6KPG7ZmepI5z5kx18X5j_Q@z>

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 6 Apr 2021 13:11:00 +0300, Tony Lindgren wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap tags/omap-for-v5.13/defconfig-signed
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: 2de5bb995656312ac1464ee29294140e9aacd642

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
