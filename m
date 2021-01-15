Return-Path: <SRS0=ftTf=GS=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EBB2C433E0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 17:09:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3433238EF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Jan 2021 17:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3433238EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2xGVgy3zjmrDd+gd2sLPOu8nrees/l2SGAfY2DX+two=; b=p6x5kopWFbWZUoOxmq2KG+4ui
	Eo/7qgoan7XJg2VHXyAwu5Dg96a0PTMKqKz38o5EafKlQ/h/iQFc5edqAnpPgVUuHBPnQthuV0bNr
	vOiwiQCvHpBaQ33QeYwpoQ71Y3tNa2zCvRQhW9DsSWt5F5HJtZwC7Oa7gbQZc3RogoIbBEzJwppPe
	tQAhaLNjZ36NHuuyHsAfKnP11NnAXMrnjkPAKU3wp/nU563R2c2TPeqakgph/q9ejpiOn64y2WoFI
	LagnheOZ9wQFz3/JfIBLFMTomqDmddGRdWlAqNedBGyFbc92dyetoXaTZjbBgESCrEchTGelhQG+A
	9vD5yOtCg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0SZY-00005k-9W; Fri, 15 Jan 2021 17:07:40 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0SZV-0008Vy-48
 for linux-arm-kernel@lists.infradead.org; Fri, 15 Jan 2021 17:07:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6CC7F238EE
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 15 Jan 2021 17:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610730456;
 bh=YGd33e7cZIPZF6DstNEUxtZMH/nm/G8oa6S58W9tI48=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=FPnuv2fY/3qW6vo+Efuf3a2q/osrtKX89hB6wxzfAKdwLsh/eF1/dfWD1CjQLUsym
 X2R92SHuwJTMePHxAIvhROIiQlwIiG4w9nHte3iqKc06gtWhIftl/edpYzLPiahMDP
 dRWNsb4W5zayr5xiN+/JuinbhcJnVzywrY8kURuFwwiPbg7XTQTp1+D1K0pVc22FoT
 5DLeJwbL0WQI3BG3JO8A7VPhUE638SngjtbGIF+m6t1nmykiob0GAuIUryMPEhMIqB
 Bo+e51XcFRwmbqO4CEWlCjKx0NYa/b2HtLVPtX5bH87TERls6fsRmHU0Sr0ZgP1vZ1
 F5nHgYfuXP0nA==
Received: by mail-ot1-f49.google.com with SMTP id i6so9194732otr.2
 for <linux-arm-kernel@lists.infradead.org>;
 Fri, 15 Jan 2021 09:07:36 -0800 (PST)
X-Gm-Message-State: AOAM531KszkS9Iwmig0yGZlXIa6aWWcSSMszj6YHW3YUjm6LXUGHpmYl
 A1PnBX1q8moysWPgT3+WhXfOa8b8pJc/VNh7+mM=
X-Google-Smtp-Source: ABdhPJyt5en3jyLXamufOnOIpe6JRbUfAFTRy2hRclm5robQJ5u/ttpnh0hYxExTSIeqywtril8uKByrr9ZjK+UsjR0=
X-Received: by 2002:a9d:7a4b:: with SMTP id z11mr9003016otm.305.1610730455799; 
 Fri, 15 Jan 2021 09:07:35 -0800 (PST)
MIME-Version: 1.0
References: <20201214043922.p7njpxzrcwfoaphe@toshiba.co.jp>
In-Reply-To: <20201214043922.p7njpxzrcwfoaphe@toshiba.co.jp>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 15 Jan 2021 18:07:19 +0100
X-Gmail-Original-Message-ID: <CAK8P3a27RkYuw8GMHWpGUbqfHjeraQCNJc7B1m_hXd4_Zgsspg@mail.gmail.com>
Message-ID: <CAK8P3a27RkYuw8GMHWpGUbqfHjeraQCNJc7B1m_hXd4_Zgsspg@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: Visconti: device tree changes for 5.11
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_120737_251364_3476157E 
X-CRM114-Status: GOOD (  11.43  )
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
Cc: Olof Johansson <olof@lixom.net>, SoC Team <soc@kernel.org>,
 yuji2.ishikawa@toshiba.co.jp, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20210115170719.3iczCSLr1kB4P4_VsWuoN7uqynJcJ_WaOouUowixauA@z>

On Mon, Dec 14, 2020 at 5:39 AM Nobuhiro Iwamatsu
<nobuhiro1.iwamatsu@toshiba.co.jp> wrote:
>
> Hi, SoC team,
>
> This request includes the WDT / DT patch for the Visconti SoC.
> Please pull for v5.11 kernel cycle.

I'm sorry this came too late before the merge window and did not make
it into v5.11.
Can you please rebase on top of v5.11-rc1 and resend the pull request?

Thanks,

      Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
