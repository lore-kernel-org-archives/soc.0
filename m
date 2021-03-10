Return-Path: <SRS0=6xFU=II=lists.infradead.org=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46C0FC433DB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Mar 2021 16:50:43 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC31264FC3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Mar 2021 16:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC31264FC3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=aGYMMhb1EzJIMLrMJ0nRBiPF7MHHtXdC7IUbiEMr5DI=; b=rIYWTJklFveq0Ht05lkLtw7j/
	i6UY2qK5Pz3Uv0ob1X/8XgISTccavdzxSnIMYUZnp7Uhm95Kohu1xpDPxx3ZgyRWSnq5d/Gq1WvQ1
	vjxjC6poSCJ51Lxms4s8U8oND+fGt+yxBORvxoDNW1nkvw0u6jwY/i8oeFHNf1AeBDwolkA+yV0FK
	s8TjJ3eTUoOTSSnB4r+hytDg7R2itLL9wXDVcoXnCQy0E6g4QKfDDqLFBpimnKD7gXAWD/ca0cX7x
	8yPQOPH/4j9rCC7bCu8lQMBfO/XIMgl263D8HLYnGV1lYepgR8d9wm0uvdYQfVrTfSKYUN8F/Ug4z
	r6LEGwoxw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lK21U-007GqL-62; Wed, 10 Mar 2021 16:49:24 +0000
Received: from mout.kundenserver.de ([212.227.126.135])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lK21P-007Gpm-CC
 for linux-arm-kernel@lists.infradead.org; Wed, 10 Mar 2021 16:49:21 +0000
Received: from mail-ot1-f44.google.com ([209.85.210.44]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MWRZr-1lE8EI081T-00XvTh for <linux-arm-kernel@lists.infradead.org>; Wed, 10
 Mar 2021 17:49:17 +0100
Received: by mail-ot1-f44.google.com with SMTP id b8so16993871oti.7
 for <linux-arm-kernel@lists.infradead.org>;
 Wed, 10 Mar 2021 08:49:15 -0800 (PST)
X-Gm-Message-State: AOAM531RyiuEfF+A+AhMBZAWbCsVxh1f7UpewV2Zud/vez7lajz/PsAy
 YC8L1DHZskqgrMMqKz3LSfQBvM64HFQOrZrbP4Y=
X-Google-Smtp-Source: ABdhPJw1kIhr8ttdGXD5g+DpuAzvAToYG1aFxOSVPDl56eSY4x70c4eQdWZH4tiH2ZUpEN9KrRB/9/YZCrDgnKY8YZU=
X-Received: by 2002:a05:6830:14c1:: with SMTP id
 t1mr3227502otq.305.1615394954588; 
 Wed, 10 Mar 2021 08:49:14 -0800 (PST)
MIME-Version: 1.0
References: <20210310083327.480837-1-krzysztof.kozlowski@canonical.com>
 <20210310083840.481615-1-krzysztof.kozlowski@canonical.com>
 <20210310083840.481615-3-krzysztof.kozlowski@canonical.com>
In-Reply-To: <20210310083840.481615-3-krzysztof.kozlowski@canonical.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 10 Mar 2021 17:48:58 +0100
X-Gmail-Original-Message-ID: <CAK8P3a27hAExCKtsO7k1HQwLKk-5Q8uxYYt_G2v-Osq8RZv2tg@mail.gmail.com>
Message-ID: <CAK8P3a27hAExCKtsO7k1HQwLKk-5Q8uxYYt_G2v-Osq8RZv2tg@mail.gmail.com>
Subject: Re: [RFC v2 5/5] clk: socfpga: allow compile testing of Stratix 10 /
 Agilex clocks
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Dinh Nguyen <dinguyen@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>,
 Lee Jones <lee.jones@linaro.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-clk <linux-clk@vger.kernel.org>, linux-edac@vger.kernel.org, 
 linux-fpga@vger.kernel.org, Networking <netdev@vger.kernel.org>, 
 linux-stm32@st-md-mailman.stormreply.com, arm-soc <arm@kernel.org>, 
 SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>
X-Provags-ID: V03:K1:h0sLajhLrOVWs72cB/wONAWl6+YjN2YRNNfHL9rpX0RUtvpYlvO
 7vYlyW9how/AwxMBN1JCZkM0HkWkHi2wBlXkvvGm6M7ABKTVTydL6v1kc8vz/DRK0HNxFRN
 5zEXEPOQDZ88GcdKvdfgW33atMiQdSFmbjmAwVy0+yEjNGF+5zVa+shMYNR62RfsZd+xs3K
 GcWPsriklSix13I8W08Ag==
X-UI-Out-Filterresults: notjunk:1;V03:K0:VGrdtcE9KPs=:HzRlRduGUO0vCaBBH7FC/8
 bxgRZKoswd9aBeFNUDAJ2XUmFQcHW1EuQcWdaD1xWPVJ9Aeze2fxwstjbIAxxTVXRuvxF/+MS
 dx+CzCkKqL26CHCDRj140f3OZeL7wketaQtoyKmsEzWZszVXPTfgxeg3eOZnfDr9oF/NN4FCa
 E9gHySgTf2x/UZr7d9mpzYoh4IKdb17LPyr7U2UP9pmr9RSWxj60rdWsUalYvE4rEobzYs4le
 BDmanYwpsGOfYIEXVP719fch5Fv4bb7Ys3rA8yM6Lv49f8bMrv021lktRwJIbGTfRx7SUCrsw
 KoVhrLnlaNkYaKnvVQTVqy/AP/cRIpmyPA5RVRk9tKTDK2xWkl8EO7k14CUOfdtkpt122lrmC
 RIoXE2wzbkhNaZCPclfmOQw5yY0f7EkkJ5NAWZdZ33aXR+D15mjXsXdur6pldFU1ohfku0K4I
 gJz5XvNUT8LqtF1hIhph9aRwQOkIEMy4HOnSIKxNPs1vjaPbtvj6ucPEsf1k1ysIkLBz9cWuo
 pt22svjFcBLK9/HURDxB2RpflgTf2SKQyZ2VeCOFh0Mllc5gX+zaq01BHkOfGy8Dw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_164919_510695_71761EDA 
X-CRM114-Status: GOOD (  12.43  )
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
Message-ID: <20210310164858.xPBIAFUQYYuk8tYkjGb2I9kliTTEQIO8CP_BfL6qN_4@z>

On Wed, Mar 10, 2021 at 9:38 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
> --- a/drivers/clk/socfpga/Kconfig
> +++ b/drivers/clk/socfpga/Kconfig
> @@ -1,6 +1,17 @@
>  # SPDX-License-Identifier: GPL-2.0
> +config COMMON_CLK_SOCFPGA
> +       bool "Intel SoCFPGA family clock support" if COMPILE_TEST && !ARCH_SOCFPGA && !ARCH_SOCFPGA64
> +       depends on ARCH_SOCFPGA || ARCH_SOCFPGA64 || COMPILE_TEST
> +       default y if ARCH_SOCFPGA || ARCH_SOCFPGA64

I think the 'depends on' line here is redundant if you also have the
'if' line and the default.

        Arnd

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
