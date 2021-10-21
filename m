Return-Path: <SRS0=6Q0g=PJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20368C433FE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Oct 2021 12:25:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4DAA461205
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Oct 2021 12:25:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4DAA461205
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xQSbvdSJkp+TqEZv2CDT3Ei0G8/5sWkOCBDQ7PWYlCk=; b=Rs0F3toYMAc8yT
	PeR6/LCWJhVK3/fN1KsattkQCWAznAL9LZdDHkkHYUUokV3z4pV2EvFvGINnUVk4Rf/Mmq+3MFMMv
	WOse5qUxqTK6JsgLujw2Xvujfp4YGr685lNgSrCWvgSMfDS2yjMP7KZQS+nXzUAyveXFFOlZ+U6nt
	9OD51m07J6jJSZie+8yMAcJiizCOD47Pn1Xn4VLj0o3bz+lMOzMRSzVmmD1OaeBNrAL9qVN5rJrCc
	a2IPn8ze0Dy9ryn42sxJkVaaJ1Wj9HP6x4DufdU2hdMj+a/HrgJPkqc7TinwH64Czhrj2pUMqzQMX
	7FEFfLigfcdaxPpNg03Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdX70-007SnJ-SG; Thu, 21 Oct 2021 12:23:59 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdX6v-007SlN-QT; Thu, 21 Oct 2021 12:23:55 +0000
Received: from mail-wm1-f41.google.com ([209.85.128.41]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MS3r9-1mFYz60YSR-00TRNU; Thu, 21 Oct 2021 14:23:51 +0200
Received: by mail-wm1-f41.google.com with SMTP id g39so479144wmp.3;
 Thu, 21 Oct 2021 05:23:51 -0700 (PDT)
X-Gm-Message-State: AOAM530PnIKxclxPPV3o1w7NiGKFKL+hVoc3s4G7hWIXbrUDqXSxd71C
 1APeMnz+eRujU/wtBhP0nr389aMLch5iij9s8Zk=
X-Google-Smtp-Source: ABdhPJyySfMSOhtA5bv4hxMOMgjYtqe9qUbX0g4CfeIRPIhQyBDPW11VeAk2UNQWRemVY//cA3QTl+gSHiVN9uJF8ao=
X-Received: by 2002:a1c:4b08:: with SMTP id y8mr6575841wma.98.1634819030835;
 Thu, 21 Oct 2021 05:23:50 -0700 (PDT)
MIME-Version: 1.0
References: <20211021090955.115005-1-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211021090955.115005-1-krzysztof.kozlowski@canonical.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 Oct 2021 14:23:34 +0200
X-Gmail-Original-Message-ID: <CAK8P3a08QiwA4+zPGLt3xA=01HLiBcLcC4gM1+8N6uo5KMTQLw@mail.gmail.com>
Message-ID: <CAK8P3a08QiwA4+zPGLt3xA=01HLiBcLcC4gM1+8N6uo5KMTQLw@mail.gmail.com>
Subject: Re: [GIT PULL] riscv: dts: few cleanups for v5.16
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
 arm-soc <arm@kernel.org>, 
 SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv <linux-riscv@lists.infradead.org>
X-Provags-ID: V03:K1:6dzDJkdrrPVm6N11cSsBQ5UhuDzbOfqHPmMVR2xnTcCv1o+p8eG
 3o3rBR/dJtI+9TQlk4IC4RUnOpPRcPBcKO1naHrz9JlXWYiyala+UM1DNiTrAPnTByVmyOV
 O9WAdeGab+X6Uq2L+Mja5AyN6gTTWz/f85AV8qMpgYY8bJIu9B/FCujjzlOWUyHtAqyW6m4
 LETOxtALMXMSgtTxnpOmw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:wJ30WRazW00=:onKfvqXFS5YErxdya6UP6m
 oFtzolUHgVG5csSpBcq2OTE/teL3QOEsvLgzSwxHTrwKiS9O3/HeQAfFI8gZvvVP3PtGVFpTU
 mi7Ipk9TwH5gS735iBZi7A9a0jJCNhl+d/47QOE+vnzNdy9dsprXdIfDCNKsL199sP9zPOvjh
 UIlEFaan7sKgM43B+TtRJdWMKwOhVpZDBGB13SZ7xBCmtJ4CkWTWcFXghQuLj9rMALNuxQYcW
 8mg5FC7LXMkrrsWo1mQOLWNfsoLBTh5mckAI+e48soC9aCQEkv6qQoF6pbLrv+lv+Uye1p53s
 ivAdj61zuswq41VkSNkG2r01L2nD7GbQZ6oxHLilQ0QgAXBZKJpih6lxtniMqmiIvhVizvr+O
 1TrFLlajwL/zlxtoKZxp9Xj3Vo9qWxjhpPye1vX+MA6xXvNgzk8utGTzhPio6Ih1ENWd7Nz9e
 jj79x53x8mQxHDwSQhREiFxz2FKlUneB5VZ6e82hw8E8xiooiujhYPtqkI0y/xayWgfKS8+cA
 4HYmGsohgIyq/vWanMVenE/mQiz2Vmr4EdcZnyn2Ba9t05HYhiGMiRl7EDZrZewckevF/Aaoi
 Slty1/8VD9uP+1eqzQ0OuS+kilWsz1gre6yhhaIkZ3C9/XvkhPcYrk8qqT/f61ysW4dAUlNjS
 QOw1lCOpK56VBpP0wNtC2SQb9PYeT5Okpdn3DribmYtSTWfyQ3kNZjp+D9t4RrqO3PQlGf63P
 uHfPw2O1ak5GpfPjWFVo24ZZZQd4iYwBH8SsZLj16Nu+DS7zk27n1Xe10IJto4RSpCljC2/0I
 LzTNStUwXuhkO8I8q/at7J0/fKs0BCo3mj9Eqmtw6TpIZbExzg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_052354_176524_621E4550 
X-CRM114-Status: GOOD (  14.50  )
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
Message-ID: <20211021122334.kkjzY-vRxtiO7eXXxr6Tw6LYRg7g5Mo-zQD8jRv_iRg@z>

On Thu, Oct 21, 2021 at 11:09 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> Hi Arnd and Olof,
>
> I have an old patchset for RISC-V dts cleanups which I sent to mailing lists in
> August 2021 (v1, v2), resent in September and pinged two times.  They got some
> review (from Alexandre Ghiti for SiFive, from Conor Dooley for Microchip) but
> unfortunately Palmer (RISC-V maintainer) did not respond here.
>
> The usual RISC-V patches go via Palmer to Linus and I am not planning to change
> that, but I want to get these fixed.
>
> Could you grab these to soc tree?

Sure, I can add them to a separate branch in the soc tree, in case the
riscv maintainers
take them after all. I notice that you have only Cc'd Palmer, but not
the other two
maintainers or the RISC-V mainling list. Adding them here to maybe get their
attention.

        Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
