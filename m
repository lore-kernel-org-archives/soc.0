Return-Path: <SRS0=aJU7=IV=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 641F3C433DB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Mar 2021 17:35:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF16B600EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Mar 2021 17:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF16B600EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eJXhrW0PBTHc5br/I4FW3NKX+7aM1lbI8fJRaEUiHcU=; b=CaPCuENP5Z/FSbe5TAVJQa3q0
	PbTCCTavHHumfx/WFKTWXurLmDMxwrEOszvinrEtsp7YSC6M8dquUXbuHveMHbuwdrSlqqN7FdOlj
	KjdSof9IXWG3/E2ByHerOOJ6gmgUXPOl9eDb97dMAluJJc3WIANOmJulhlYGtPvXgCYglKX2T3yyF
	CvsxyOKoXH/Gx6/FMdF2PgLnvOOEN2N3cKplBKoYbKW31mSeWUIbvDsIA4hOXnO3XxImmaehFHVgV
	0DUuHMhIRUe8XxNXEHSL/NMWNvv8WUIXgpUt7/gKHtb6iqzR16TF6YY3NrSf7b8WJsuzKUPD9yioB
	0MkMCK0/Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOkuU-00FPXI-2P; Tue, 23 Mar 2021 17:33:42 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOkuO-00FPVz-03
 for linux-arm-kernel@lists.infradead.org; Tue, 23 Mar 2021 17:33:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2BA7D619C1;
 Tue, 23 Mar 2021 17:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616520814;
 bh=D1SW3s3mSner/+64SWK4kWmpA5riGvih25dnjKUDQ0w=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NOF2A4J9sS5kZXJML5JTXwwttuGylo3oMMX8sSp8Xl+Gjz3k9wAZfog+HG6gTj8bW
 svDR407SRG0vD8VfXXTfx8AD5nT55/z5xcYiwu/at5PjVRvTtX5YboKIuFZhpnKGMl
 VGbjekOmDm+n1Be2LVnF2Tn/ClXj8JBOhGGMMedBD3QWnoL5dVwg6CoeHTYsN4vZvn
 On6SJwzUR2rzsmrMfUljKJUAr0QqrSePBrf2IJfU3GGFMzqQAjq4c4QiiPbFaxBvPW
 gTbZqWEgtHkWWh4tS1KWZbOWBRKl3rSkFZvX8+9hw800zgzGSpo071w+0d/q9FPdlS
 KaT8b189IV5mw==
From: Arnd Bergmann <arnd@kernel.org>
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, arm-soc <soc@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL 1/3] Renesas ARM defconfig updates for v5.13
Date: Tue, 23 Mar 2021 18:33:30 +0100
Message-ID: <161652079858.2900879.12964454491151691553.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210319085146.2709844-2-geert+renesas@glider.be>
References: <20210319085146.2709844-1-geert+renesas@glider.be>
 <20210319085146.2709844-2-geert+renesas@glider.be>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_173336_433648_4230F44A 
X-CRM114-Status: UNSURE (   6.81  )
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
Message-ID: <20210323173330._iCIMBEu7cb2u5-K-kycW5-pLWFyxDZ3GoPW5HCqGFQ@z>

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 19 Mar 2021 09:51:44 +0100, Geert Uytterhoeven wrote:
> The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:
> 
>   Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-arm-defconfig-for-v5.13-tag1
> 
> [...]

Merged into arm/defconfig, thanks!

merge commit: b61ecafafe9cbe8e99206bb7ef638d8e8340515d

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
