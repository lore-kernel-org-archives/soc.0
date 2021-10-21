Return-Path: <SRS0=6Q0g=PJ=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED7DCC433EF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Oct 2021 15:27:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A49FE610A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Oct 2021 15:27:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A49FE610A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E69HsFQRWo0ZBTDpCNxPaBk1W3UtewFy7Hqt82tIOv0=; b=TJzoXBnng21xFC
	sBz6FNObWpsItmjgDfgUCryF72+ReEGmKvCPLkj8dAVhKJ/qcv0K65D74PKZcYASWNBHjzhkzn9aL
	33sLmuSZnnSJMBAN7KbAA8K2c1+hQVVVkPPLzCdsoSl7ET+g2CZZi/QGzr6lZjV0m79OqfrtTwOO6
	1kNZ6v3kYpBaeu4oAZRi0thVJeE8KvXNJjIaGc0bidG4tizc8ikuGula10vI27BlutbBUYN/zcTNk
	GO/T8Po3PdqKLMkr5pstNtIE7fxCEur3Qhf04cCu+b/y3/Pr3aOroJLTXS0L/RebmLM0fW+ZX5e4F
	AYpYj1e6FfBovVFBoxGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdZxH-0086XF-18; Thu, 21 Oct 2021 15:26:07 +0000
Received: from mout.kundenserver.de ([212.227.17.24])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdZq2-0083ds-J1; Thu, 21 Oct 2021 15:18:40 +0000
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MIcux-1mRFe841gb-00Egb1; Thu, 21 Oct 2021 17:18:34 +0200
Received: by mail-wr1-f47.google.com with SMTP id k7so4132wrd.13;
 Thu, 21 Oct 2021 08:18:33 -0700 (PDT)
X-Gm-Message-State: AOAM532r/4kkoiCHR1H3f/kGXDkys0amO21cW+dG3FkjPsFtxhxgDxdN
 7iVCEvb8u2vHdmM2jlZn+2iEp0hRTTbhxhPmGoI=
X-Google-Smtp-Source: ABdhPJzubqshEiLe+W75XqiMDuKS74vXTaVdmhaIE7BX2wz7LJCvkZXMHN8SDJ7n99D+gIARU+bX3b9fQpoTH7B8Bao=
X-Received: by 2002:adf:e292:: with SMTP id v18mr7748646wri.369.1634829513272; 
 Thu, 21 Oct 2021 08:18:33 -0700 (PDT)
MIME-Version: 1.0
References: <4a27b400-4fb1-bb7a-335a-ae1d084cdf73@canonical.com>
 <mhng-743556e6-a149-4301-8c4b-c14b3bf4d3d8@palmerdabbelt-glaptop>
In-Reply-To: <mhng-743556e6-a149-4301-8c4b-c14b3bf4d3d8@palmerdabbelt-glaptop>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 21 Oct 2021 17:18:16 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0dnRE4Sr-En-hPYbRAWAYgYZ7FBtC2h39RXggy=tA_HQ@mail.gmail.com>
Message-ID: <CAK8P3a0dnRE4Sr-En-hPYbRAWAYgYZ7FBtC2h39RXggy=tA_HQ@mail.gmail.com>
Subject: Re: [GIT PULL] riscv: dts: few cleanups for v5.16
To: Palmer Dabbelt <palmerdabbelt@google.com>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Conor.Dooley@microchip.com, 
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
 arm-soc <arm@kernel.org>, 
 SoC Team <soc@kernel.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/SAMSUNG EXYNOS ARM ARCHITECTURES"
 <linux-samsung-soc@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-riscv <linux-riscv@lists.infradead.org>
X-Provags-ID: V03:K1:rRaVHVT4RoHY5x8HcVM6uBYilSiWyN3ZJ9uGRRUgBYiC//Jylhb
 r+u2SRz18724OwaYvdi1QCb8QNCbQlVRd5l2r3raDwZxVrCQlDVux0Pb7Syaw3T2hB7j5tL
 If1YDcnZzxh54cxFfP2bbHQK78q0/tYb3TFVDosqy9Pcjy7B6R7wCTy8pJtd7jLhpYA23xc
 SpTBVaql4cEP/Eupy76dg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:+8quiCR3gPw=:t26h9qnrbkxlDf/v3pUOJK
 E+wajItwFjPcIyQWL5CCkW9X2jMR9tTjmH6OsTldGe9iW0z4VErNQpSc6btBPI8xnKCN6AvON
 0fie4EctphfrPzbakETfpeeJBktQAxk32oOyTXcVybyzyT+bHgGh+8EAi0FTLs189y3h8Ktz2
 5wQxmhTj30+viKt5zFyeDC4iyFyMzF07mqseYWOmruTYtRgJyAv8udd25UBEW5bbM9hINa+Ox
 DtguTzAg3UqNeA8SnbQqWIx1TgOAYOsqy9dSYMwM05oK9PemxqW2Lyo22pHoaRrmbeTTt7Hf8
 9ioUmh5RpatnVARX1VS6fpWXlyxz0VkvIIW/VnTc2FmhUc8nVBCiBo0O/p3nATrGISoZH96Zv
 jQvhiGvxrbjwkfLp/+OHyYqBr5sHPcEIervm7Tpa490KW2vPawNwjDgL9KTGTNyX9dHro0bkg
 gu77OHJ4p/SHm0prAWdtiH4l5eOCuaGxgE7lDHAgHRseMwQLd+WSDyPtfRaLROZrfzSQLJBqJ
 gZzPgvhtz1MPDjPFg5+r7bb7uACDNyTvQweCautsZHtNoxOQLOTuGg8ZAxcaOyEJK8XTTqaYn
 5dwwfFbxS2W77h+SMwmqobZX02YjmY6hfKnGIbdr+zI11SsxckZ4JO32teh+U2tEprUqm0DN/
 e+lX/03kNXo4CxatB9nGyaDyrCB6T+eywp6Mstxm/069GN+AC83II6ZgHqggEplLbhuo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211021_081838_963106_C09CA0B2 
X-CRM114-Status: GOOD (  14.45  )
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
Message-ID: <20211021151816.2776T-8xzuW6fiyqacqWms7Rg3JObNjaupG_5qVztVA@z>

On Thu, Oct 21, 2021 at 5:06 PM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
> On Thu, 21 Oct 2021 06:09:50 PDT (-0700), krzysztof.kozlowski@canonical.com wrote:
> >
> > There is only one Microchip patch here (plic/clint). Others are for
> > SiFive. All the patches are described in the pull reqeust:
> > https://lore.kernel.org/lkml/20211021090955.115005-1-krzysztof.kozlowski@canonical.com/
> >
> > I had also second set of RISC-V patches for Microchip. These were picked
> > up by Palmer:
> > https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git/log/?h=for-next
>
> Sorry I missed this.  If you guys took this through the SOC tree that's
> fine, otherwise LMK and I'll put it in the RISC-V tree.

I haven't merged it yet, please add it to your tree then.

        Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
