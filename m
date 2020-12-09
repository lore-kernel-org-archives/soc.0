Return-Path: <SRS0=W7ES=FN=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 515C1C4361B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 17:02:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ED03923C43
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Dec 2020 17:02:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ED03923C43
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pJ6+rkzKQc2Pkd0p2Hv3ahEnvFfKRIEnxt24dhpc10E=; b=ED5f1NoKCjk3368gVoP89WbaH
	CHNcn4n4Y9EYr5Eu+B4tKGY78apAYwHUhVqnucsGurgqagTvfS081D6ESvmUbrIJdgLK0Hy8EauiP
	rULOaE4iEMZAT43jIjN5tXr883g4um87JtZSQDpiUVCV1W8HQaQqKKhWK0fYd9Y/scI6WieNBSXbP
	D+Go+H5vV/f52iHL8/47Prxn3cw0L9+XluWrIc+cmHu0OMFehqN2cgsxE8bS/aucuiL8nvsh3irOB
	dzpZY/zZ/5BdAWQ9yWx/G+WdKFYClQntMYWs9caLbrlmmWjoi0zPAe7svFyW7ODze5CfrG3CNBs14
	6gerSuE/g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kn2qI-0004aD-JN; Wed, 09 Dec 2020 17:01:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kn2qC-0004YL-IC
 for linux-arm-kernel@lists.infradead.org; Wed, 09 Dec 2020 17:01:25 +0000
X-Gm-Message-State: AOAM530iIOLMJTPtiFqXqyJiDgUAD2pejQ4hnuxhfNXYvmx05buzy/VJ
 qzbVn5lR5kX6rhKV5ofslis6uQigNeKqd5itZRM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607533283;
 bh=9vFT6yJYkF46vbUR6Srtzis/Epuio+A30+71uKluc3w=;
 h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
 b=T997hC+n5hKMiL0ZOqbId24Jbl1IE68kCt1jDDbAUuHoF5NsEOI9EDu3OtkZAbQAX
 wB5yRSwoHXpfM4oaAPcDSZqs35YbjupMt1MZWDwKph9VzHsO6Yr/XtXhZibmT7VZPr
 3tg2brJF+vcc0n4/2bHLGiI6x4iamfIvx4ldDBpdL7AqazBUsKUTrzTa2JmfKSAbF5
 uZyMZ4Pl6PfPNznVwHHQHIUD+uoALRJ6ri3MFu/QtB0wHj6LkqcFZWVO1gF1L/CbOz
 IDDymydgekiXa9OvTZnkbpMahxUHSiPCv3ee+IrMXhKnG8m4mshGesNH/dkKYT4n2v
 FACCviZabCAfA==
X-Google-Smtp-Source: ABdhPJzf0S0JyawVfrlGrgNSMXIvrVUCeAYxFXwUTOTAQsH5H4gcg2tuIko/YcdA3w29HqKrRBTuXd/3ZVE5djAGOvA=
X-Received: by 2002:aca:418b:: with SMTP id o133mr2346271oia.67.1607533282924; 
 Wed, 09 Dec 2020 09:01:22 -0800 (PST)
MIME-Version: 1.0
References: <752fc10f-c2eb-736e-8a11-13e770f50c90@monstr.eu>
In-Reply-To: <752fc10f-c2eb-736e-8a11-13e770f50c90@monstr.eu>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 9 Dec 2020 18:01:05 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3J6tMELTO-Fzq_3a9mdYJ=zDDzG-0M2fUmGN8pUOjnfg@mail.gmail.com>
Message-ID: <CAK8P3a3J6tMELTO-Fzq_3a9mdYJ=zDDzG-0M2fUmGN8pUOjnfg@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: dts zynq: Xilinx DT changes for v5.11
To: Michal Simek <monstr@monstr.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_120124_692487_7D2428E1 
X-CRM114-Status: GOOD (  12.18  )
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
Cc: SoC Team <soc@kernel.org>, arm-soc <arm@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
Message-ID: <20201209170105.QQQ6dx-F2oWcLcYzB-HpWHcRnM3F1d4IOvomF3TuYU4@z>

On Wed, Dec 9, 2020 at 3:51 PM Michal Simek <monstr@monstr.eu> wrote:
>
> Hi,
>
> please pull the following changes to your tree. The tree is based on
> zynqmp-soc-fixes-for-v5.10-rc6 tag or acfdd18591ea ("firmware: xilinx:
> Use hash-table for api feature check") which went to v5.10-rc6.

Is it necessary that this is based on top of the bugfix? This means
I'd have to do a backmerged of -rc4 into my dt tree, which is something
I would prefer to avoid.

I also notice that the subject is the same as the DT pull request, which
seems to have messed up patchwork into thinking it is an updated
version of the former.  If I had not noticed the backmerge, the DT pull
request would have gotten lost.

       Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
