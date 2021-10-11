Return-Path: <SRS0=0Wma=O7=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CC09C433EF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Oct 2021 21:09:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CED30601FC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Oct 2021 21:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CED30601FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/SF6QEJmErhO6PGEg3zBNyt68XeNedZkYNwZbdsTTU4=; b=sViaZL9XKlAkPN
	3YwL2jpIjLBGLQw8aoJ1TIA385fF+B5vo2E0mdqYBeISLU21QGLQu9oDJIACpNDG700zfSAEZVjfx
	T6DjAqMS/WpDxxC71PwbPeVplESHNJNBBkbrPUFuBLCSK2hXcHgNNUonyjNWu3cxKVRyoQn8GRj7F
	iS0W7aj3mSvmxY/hDDY6L3EFhbq4hpw0I8Lyt26nHvioZ7/K2YK3qpX/9Pb2gbrDvigV4g5dr0p3S
	N+hWht+Tyh5Lw/6nIaX/a5g+F+HLPBaEOfcWB1I5aTegU5VStQCNHp3TTYGrtRKvDKSiz7w1mJjEj
	gEby2ZvZEG+9uHDd49Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ma2VV-00AhZr-KI; Mon, 11 Oct 2021 21:06:51 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ma2QI-00AgUq-Ft
 for linux-arm-kernel@lists.infradead.org; Mon, 11 Oct 2021 21:01:28 +0000
Received: from mail-wr1-f44.google.com ([209.85.221.44]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MvsMz-1mrHxT38eF-00ss0O for <linux-arm-kernel@lists.infradead.org>; Mon,
 11 Oct 2021 23:01:24 +0200
Received: by mail-wr1-f44.google.com with SMTP id r10so60158834wra.12
 for <linux-arm-kernel@lists.infradead.org>;
 Mon, 11 Oct 2021 14:01:24 -0700 (PDT)
X-Gm-Message-State: AOAM5311LnBb0lJ/DPgQym2cfNE1AZYZBIhrKKDdf/m76cP3ZMAPgTYN
 JnA/Jl9Ec3jVkkb2+TxuqRM5O8pI+A5vc2vFI5c=
X-Google-Smtp-Source: ABdhPJwJlum4oCdRbc3gkZC+CU0jqqrsb2c79AL+PGtKmiX7j5JjRUVa5I5C2ZIVTw28c/jHjdNNO1NBcNYOXZnCGJY=
X-Received: by 2002:a05:600c:4f4d:: with SMTP id
 m13mr1388672wmq.82.1633986084389; 
 Mon, 11 Oct 2021 14:01:24 -0700 (PDT)
MIME-Version: 1.0
References: <20211008034533.343167-3-zhang.lyra@gmail.com>
 <202110120420.QA3lbmW1-lkp@intel.com>
In-Reply-To: <202110120420.QA3lbmW1-lkp@intel.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 11 Oct 2021 23:01:08 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0bDn3Eu6sTjrg1=vx-jrrvvrrkA7GVVj3puSF28BZ+Hg@mail.gmail.com>
Message-ID: <CAK8P3a0bDn3Eu6sTjrg1=vx-jrrvvrrkA7GVVj3puSF28BZ+Hg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: Add support for Unisoc's UMS512
To: kernel test robot <lkp@intel.com>
List-Id: <soc.lore.kernel.org>
Cc: Chunyan Zhang <zhang.lyra@gmail.com>, SoC Team <soc@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 kbuild-all@lists.01.org, Linux ARM <linux-arm-kernel@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 Baolin Wang <baolin.wang7@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
 LKML <linux-kernel@vger.kernel.org>
X-Provags-ID: V03:K1:VPWEULz1lSKeE3MY9Ocp//fheEtNltYVQineggQ9enhKPOIzDlr
 L723VHvJVV582Vd+vjeSvTBtiqgF5HH5mKGgJ1MXsnUn+cUDA1EVus45p6foMgmd7QZVCQG
 b+dmfv8lDSILM/f2/9LyoHZ4UKmtlVSTguHg+uG1QWZDYPaFlB0QNyd0IrDA43xmcyqi8Xe
 M/TN0IJfLnSnyzBD/DB8w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gQPG+0yNo48=:/M+OAh05YCUspF9dFuZznC
 Zolj57K7VAOJBe6qP2MS14I3ROn32h6kGjbEBy6Crsa0sq47AX+Rh96uZo2SINGyH9G435glL
 VaQ8IoJRnErdrHOB0rUTWUBjbkHJt0PE17vnh3kXKZ8gAvbLrn5Z7eBxcvf7Bske0MRNQKEkj
 uH3okcRijk/V3GZ33XxQRTFaUHgkvfvPkx+eCZbAEDn3hSqw0OmmaunjGPUbsMFpSwsGZvQCH
 9AdCB0KPS8h+jkusot1GSVVUvqyTFA2QU/E2xvWQIs8JB3C7sM410VFGxewiV42IStqdq0SOp
 dQjGJD7o1nM8PIr//WqmYa1guvxd5BnKWM4gim5vJu++LooxXstsy4MMY1aJRqgHxNa+VJBqS
 v3FTAi3kADg3p8Y6X3bIouAOEgSWvHYhnFpkYuB7nTP3/3JYLPNSZHFwNZs2tbDtdCDDRDatI
 7uyX+mfHM0TMM6LbxnMpNuB1wvItQHSMklXNYytgaNm9eJqzeyKZ511thzspIdmsT4yA5GROL
 iVSpp2Mprb6l2Zx1UvD5hBco9leuju6rK0jBrcFVQzoJkPeqZgGWXPxWC+JqvbzGuJd0kE/vf
 3SC5ur2LDu8mavD7FXUqqH+AJAMy7eivdiJduci53eqNpX758pmqerCMQd7cH4otlo5MgaUXe
 34LZqR4JMMTKN1wfw9I1LQ+H8pnNJhnk/Nf8qkCIIGv94OLpOTJ+QlwlY8pMfyVgzymTB2Jxt
 hVXgmQBmEZjmKjvSjbjItAakXLdgQ6XYIg+pezS3ILmJXBMPch5RWLeK6q8AdbrKbFYwZioP0
 e34fcPvcWbViiMNGDJzZ56CdWSo3+f7BxuL8vVHO2DjCsvR/GV2elGPljgtOut46E6D55ucmD
 VxbFOHyYkKaJwzvM6Uxg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_140126_855768_7F581B6B 
X-CRM114-Status: GOOD (  16.97  )
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
Message-ID: <20211011210108._SCOaeed5AsHqYU-FE9CfI1XTeBg5rp2enokQbevtKY@z>

On Mon, Oct 11, 2021 at 10:29 PM kernel test robot <lkp@intel.com> wrote:
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
>    In file included from arch/arm64/boot/dts/sprd/ums512-1h10.dts:11:
> >> arch/arm64/boot/dts/sprd/ums512.dtsi:8:10: fatal error: dt-bindings/clock/sprd,ums512-clk.h: No such file or directory
>        8 | #include <dt-bindings/clock/sprd,ums512-clk.h>
>          |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>    compilation terminated.
>
>
> vim +8 arch/arm64/boot/dts/sprd/ums512.dtsi
>
>    > 8  #include <dt-bindings/clock/sprd,ums512-clk.h>
>      9  #include <dt-bindings/interrupt-controller/arm-gic.h>

Thanks for the report.

Unfortunately I just pulled this, and then a bunch of other things on top.

Looking at linux-next, the binding is not merged yet, which means I should
not take this one anyway.

I'll keep the first patch and revert this one.

         Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
