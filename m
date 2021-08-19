Return-Path: <SRS0=soWq=NK=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2053C4338F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Aug 2021 21:43:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 90E1A6108F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Aug 2021 21:43:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 90E1A6108F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mlnX3Wtqm0S2UgpsyuNbb2AXZM8vpQGwMFrNwzFv09k=; b=z3tomdOa4HRIbh
	0YAwYPMMR7yfoQuS4lSqiwcY5l1aM2l/D60byrxwaHnOr8AlTdtj44f+PYI6bBbThTTK/JfcjF/Dc
	M3eImo3jbRxYhg11FgUxFOMQXp21bQH4X29/WRvdDA+1LiFaLL2wiDlT7USvbH4P9XPzfgXRIhwfa
	W+a7lUBRz/hhfIkk2/cgpaz94KsSg5f3CRIWe8vfN9bHg2JXT9045MLvHrgjscYed2KPk/kAUVc8n
	gPClA3ookN4SA54Pc8dO6dirKxYcMVjK8+Xlm2829h89KXtOp7EmdfnP8uObpcqnGsCkXpzD501qM
	PvdURyLpe+HM1UX3lLoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mGpn4-009Urq-AN; Thu, 19 Aug 2021 21:41:34 +0000
Received: from mout.kundenserver.de ([212.227.126.131])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mGpmo-009Umz-FV
 for linux-arm-kernel@lists.infradead.org; Thu, 19 Aug 2021 21:41:20 +0000
Received: from mail-wr1-f41.google.com ([209.85.221.41]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MlsWZ-1myRvW3Zg3-00j2WX for <linux-arm-kernel@lists.infradead.org>; Thu, 19
 Aug 2021 23:41:13 +0200
Received: by mail-wr1-f41.google.com with SMTP id h13so11156932wrp.1
 for <linux-arm-kernel@lists.infradead.org>;
 Thu, 19 Aug 2021 14:41:13 -0700 (PDT)
X-Gm-Message-State: AOAM530GcOuxVgKNPL/BrkgzWjeUoMkK4pO87Zd5MwVQYvRzhQngHmyD
 VYoE1iMkzgt4i5uw33rK4sFTnkjXtNR5VPWjpls=
X-Google-Smtp-Source: ABdhPJwgQXlZtd9aQGhUETRO3j8EuerYQ1TH+GOAUcV1c6qR7kBSbBDaUf/YOR2NNp44khyUSHmTwZDd2CaItxBz1bo=
X-Received: by 2002:adf:e107:: with SMTP id t7mr6159638wrz.165.1629409273404; 
 Thu, 19 Aug 2021 14:41:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210818204422.17919-1-krzysztof.kozlowski@canonical.com>
 <162938788185.467628.13192922419725983504.b4-ty@arndb.de>
In-Reply-To: <162938788185.467628.13192922419725983504.b4-ty@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 19 Aug 2021 23:40:57 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1RO=PWUGi_aFA2rzn2119W-kX2kTOycEG6hoTqPBj7=Q@mail.gmail.com>
Message-ID: <CAK8P3a1RO=PWUGi_aFA2rzn2119W-kX2kTOycEG6hoTqPBj7=Q@mail.gmail.com>
Subject: Re: [PATCH][PULL/direct] ARM: s3c: delete unneed local variable
 "delay"
List-Id: <soc.lore.kernel.org>
To: arm-soc <arm@kernel.org>, SoC Team <soc@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Olof Johansson <olof@lixom.net>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Jason Wang <wangborong@cdjrlc.com>, 
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-Provags-ID: V03:K1:eF8FtZvaFThqRaOZoFXnKxkKCvDxD2Z4xlv0fvlLblBtULHnS8e
 VAPupnNrfvWJN6GTbf9GPfx+Uh0u7jNgS26Qjt2x7H79FSQTvTHlqV97EkBiZOFZh7uiWeq
 XoVk5EL0cCnd9FomODwdY9i8LtvWi8G8fgBgCAn0lrUtvVLw67ZV5MbNGGJFpmyfQegUtt0
 uBqQlq6i+fTBMQkkoEsSw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3jetMi50vNo=:V8MVavO1EV4f+ZjOgpdt8Q
 4Pv2EhYdbZDE4yX5jB75wO/o5DwDqHI2Y664OV0D9NgNJtbIwsIoyK05bnkOke/00uFiDetAK
 cTZF7wFP1iqLF8dSXx9iff/jWhTnEfpkYsbx5IMwImB4tAGvmaodZ/2qaS7HQWO025RY3dnCF
 L8tqRvQcLtLwPw9ZL6PmEyJ9pDGtPDK4JC3kuMlecfsE1UhLP+H6zsCfbXIycQ6s42mYjerDW
 yH+K9KPAcQUTlBjH5hneGzf1QoigM5SnP7bZTAZ6lsQaxfiHlDcHjOn+LcMyExIV8AoXVHnZ4
 QBCHABJlsv0mIlpf8RO6xjPyOWTCy+5kd4n85yJ51sVUgXOAWqypRHh6MSF8afEFzVSMkVfEI
 E7+XfgWr3DMuanA0keebGDJgTFqcdWoxfqEXNneMz1PVZobMewqpz5NrmQvXetLX/jtBnXyXO
 n72Ux3BMw3qbiWmIT46qiCjR6S4G16ybFW8nyPnW82NGPOtSHov2flFGCBDQsEL0KF7PaTrw/
 lGw3TG4ppudZlgxUL4Me39qHkJv1mcV94rmdMk+vuTfFJQFQ2nr3wDnDUpM/6P0OVEH8macSe
 X3HYWO8OO5YeITRBHe+YgdszXi0NoxSsTLKJC65ztoro80E++7Pubd3V/SDLUcXTfM2NBqEEs
 +xAKQp2l/njzAXYNuuOIMypbvPGLNYmXw+xwtcCns5mN95hCsyWZQ+IytjQ3+b+w2hvEFudm8
 V3UeAQJi8mtLMVNhYg+D5Wobcl205UG4LHAGnUYplV4gzTaUbcfciDp0D/F3to+8+FPEr877i
 qI3YNyqU+T2/h/XNA7xbW5DIbncOhE5CPkmCHOYOZUfQkQrgN4QURzGXAOB925UQBHDVgsohR
 i81hP4Yn12WqlDDDg3o+DfQjVtQUWs+2iP+44Xg9lKoHXq8J4osPNEyTZjQcDZpGbauDSHNJn
 6DmAjp4FOX+4MH4cVXuteY71Q6tjxFfdQwTzQkjnceSAdDxOaZerK
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210819_144118_871096_3276AA95 
X-CRM114-Status: GOOD (  11.98  )
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
Message-ID: <20210819214057.euW1HyinddUzKlk3NoRfIdPVrmDpuNlMLJOS8cCtaBE@z>

On Thu, Aug 19, 2021 at 5:44 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> On Wed, 18 Aug 2021 22:44:22 +0200, Krzysztof Kozlowski wrote:
> > "delay" variable on line 79 can be deleted by returning "0" on line 88.
>
> Applied to for-next, thanks!
>
> [1/1] ARM: s3c: delete unneed local variable "delay"
>       commit: 319a1b58f6c7432345f13383b26c8c10e7eb1dda

I had accidentally added this to the arm/fixes branch at first, but corrected
that now and applied it to arm/soc instead, as you intended.

          Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
