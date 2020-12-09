Return-Path: <SRS0=W7ES=FN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18EB8C433FE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 22:08:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C52F823D1C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 22:08:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C52F823D1C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wHoShdlMLdtaJQuJ6Nh2Bq7gL7z/2p/RjmRzPAQG1SU=; b=B1JkHH3EvLkvC/uEj+UfWrAVq
	399fllkfdrbG6S4UyNcxqf0YysDuyx32kq0f/N2VDHg4vzpAC/k85xTXC7+HYYW80ECyRZDtjgCMD
	ikFLlqPispWA9G1NPKgpGjZGFGSkroCpL7m8QKBkMhxeKI7CVAYAuPLUeKHbRebjNAsOwdVt+QY52
	ihPLXTrsB7jAVTJhsQGx9S0VXaDrobdNF4uROmhCEJSzjiP6+iety5813L0Vi1BtAIO4abqHWxWsP
	RPA77aDdWiSND1TRjgHjh3syOhfTG2fnrhP+6sLIRmM730SGGD6PlDSLqwRs1scmbzcRWmA+KY3UC
	oQqttRRnA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn7cS-0000yt-Bv; Wed, 09 Dec 2020 22:07:32 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn7cP-0000yS-ND
 for linux-arm-kernel@lists.infradead.org; Wed, 09 Dec 2020 22:07:30 +0000
X-Gm-Message-State: AOAM532lVNC4tJBUix8CCllM4dYl06ehK2gZQkEcuYChJMgTUmjCjZqR
 GnVG1jBe1jq76LA84q8Vrlq2g6WwnBjXAeYAjTo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607551647;
 bh=gPmQMQEImLWPvAjaFsGIPTOSRzUDA+6UU1BaItnv6ys=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=e/AvN8Ypejn2MmfW6qyx0Rn59iHHmUhYF5ZGwDmEQNfWUvw5d2s6Q/u6aawV4CrDa
 jefRjJklOi5ns2tcRW5hG6g7OqUdz+voRP6xB0nT83iyFCZLMh8D9basDnSYGUTjN9
 5s3zIfMWKxjAebKYLj8A+USJL9NCxsjC8Ox+3ttDrss0BAia1r7XHuuefoTfYc/lYi
 5fIg9GsdbcJH/esi88RMEk+0CWvnrOgCAYZm2mJBDCnum4YrUnFqtFWe/YU7D4UiJr
 I0wD9xKANtztgYphjFLZMB+AK3CnxDaetKc0tLBDWT+gPgQnxNavsVopPTxsCW+HGP
 JzpWQvirfOT3w==
X-Google-Smtp-Source: ABdhPJyUJyv3UGMfoQHaB8VACaJj065fMta9S1/6u7U1l8vdriFarOSmG+mvHYs9He/Olwiu7qS7RhpCXwqEb4+ckA8=
X-Received: by 2002:a9d:6317:: with SMTP id q23mr3657222otk.251.1607551646244; 
 Wed, 09 Dec 2020 14:07:26 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a04h2KA6s-m_O2MJ098frTSmxvAg-ngrdP4d9=9YLXmyw@mail.gmail.com>
In-Reply-To: <CAK8P3a04h2KA6s-m_O2MJ098frTSmxvAg-ngrdP4d9=9YLXmyw@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 9 Dec 2020 23:07:10 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2piZwSjDudPu8mOEBnRHFAXRBMcRZsqS8b6YD3Kjwsow@mail.gmail.com>
Message-ID: <CAK8P3a2piZwSjDudPu8mOEBnRHFAXRBMcRZsqS8b6YD3Kjwsow@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for v5.10, part 4
To: Linus Torvalds <torvalds@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_170729_862783_C10C3E1B 
X-CRM114-Status: GOOD (  12.30  )
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, SoC Team <soc@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201209220710.uEjYS-VHd3VinR7HOteBptAvSEPX1uhAD9438tUN4vU@z>

On Wed, Dec 9, 2020 at 10:14 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> The following changes since commit 0477e92881850d44910a7e94fc2c46f96faa131f:
>
>   Linux 5.10-rc7 (2020-12-06 14:25:12 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
> tags/arm-soc-fixes-v5.10-4
>
> for you to fetch changes up to a0cab089baf3048020de7bee53bccd598747126a:
>
>   ARM: dts: mmp2-olpc-xo-1-75: clear the warnings when make dtbs
> (2020-12-09 20:43:13 +0100)
>
> ----------------------------------------------------------------
> ARM: SoC fixes for v5.10, part 4

Stephen Rothwell just pointed out that one of the fixes I added today
was missing a Signed-off-by. I corrected that and uploaded a new tag

  git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
tags/arm-soc-fixes-v5.10-4b

in its place. The contents are the same, but the new
HEAD commit is 69fe24d1d80feac4289778582cf0a15256d59baf

If you haven't already pulled it, please use that one instead. Sorry
for my mistake.

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
