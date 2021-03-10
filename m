Return-Path: <SRS0=mund=II=arndb.de=arnd@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121D5C433E0
	for <soc@archiver.kernel.org>; Wed, 10 Mar 2021 16:49:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix)
	id E188064FC7; Wed, 10 Mar 2021 16:49:18 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3AA4864F58;
	Wed, 10 Mar 2021 16:49:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3AA4864F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=arnd@arndb.de
Received: from mail-ot1-f41.google.com ([209.85.210.41]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MjSwu-1m0CTG2XHO-00kwV4; Wed, 10 Mar 2021 17:49:16 +0100
Received: by mail-ot1-f41.google.com with SMTP id j22so11173382otp.2;
        Wed, 10 Mar 2021 08:49:15 -0800 (PST)
X-Gm-Message-State: AOAM533FjQvO3zSqnzYAhlJLG0pr6NNVJ/qhpw7rgZ6Oe70PwaDVnm0Z
	MwKALfbKJu01WH/uOB7JQusw/+kcgzrsJJg0oPM=
X-Google-Smtp-Source: ABdhPJw1kIhr8ttdGXD5g+DpuAzvAToYG1aFxOSVPDl56eSY4x70c4eQdWZH4tiH2ZUpEN9KrRB/9/YZCrDgnKY8YZU=
X-Received: by 2002:a05:6830:14c1:: with SMTP id t1mr3227502otq.305.1615394954588;
 Wed, 10 Mar 2021 08:49:14 -0800 (PST)
MIME-Version: 1.0
References: <20210310083327.480837-1-krzysztof.kozlowski@canonical.com>
 <20210310083840.481615-1-krzysztof.kozlowski@canonical.com> <20210310083840.481615-3-krzysztof.kozlowski@canonical.com>
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
	Moritz Fischer <mdf@kernel.org>, Tom Rix <trix@redhat.com>, Lee Jones <lee.jones@linaro.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>, 
	linux-clk <linux-clk@vger.kernel.org>, linux-edac@vger.kernel.org, 
	linux-fpga@vger.kernel.org, Networking <netdev@vger.kernel.org>, 
	linux-stm32@st-md-mailman.stormreply.com, arm-soc <arm@kernel.org>, 
	SoC Team <soc@kernel.org>, Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:cAbO536Fg7OUTuBGhhIO8r2afrHcLIReenDXNkWFKWTgY2JJvOE
 Iu810YdDk1la4ihVODfQgraQqv0gga6tPJq7mWl/PPe6VBE/iiH8hVw2twfJwUm3L15J6Dv
 6gUrXfkcluGXO6kVCB+Dfp3XsmDz3B2XPR8ub77bFiMDzbfUFpMAtm9/YSToKCUjgricXWr
 Qf6ko79dZ9kJ+6OLEzzLA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5Th2fdq2XgA=:w0iAunYwK6LgZhV5XNNHBf
 c0ZDOxBXj6JFuRCywxUpMG130g4eyEUOLAKlCeAQc5u3QCUUSZOzSTXZjkRUguC0fo3ix0uHl
 7AaddC4ZWph9vat5HBnSfbxDHR4L/UYQGFcVlkziP27gPcIWr7N+W3lYhe0Zkz0eGIYJqUPGt
 4jOU8YXxm4uNVnN9AFc+hEkRTFx4jGLLuSJ8+5dJ13wBDUXUytpljjg0EMA9kMKk0H/jzBrMP
 VECInDWCGNv/RIkuMYYKqfKXjQ9OKeiK6pF+0qfErWYCazHCYTZ7XAqZSrfW2ES6ymbarDocK
 qq8fzssgWgOsyCYVAmdYohk2MtWjuMGuJfyG7N7MfN9CjEgR+HcRW2+iN1QhG1seNf0UidnAz
 GTuz5qopnW3D2XXhFRlzRCR+uCSVQqBwY3pXpFsc6eptoJWbr2Adn1uM+wycweTSkSxKgCc3r
 rGsdiSR8ggWJLM/7LJEb+hayXfg5dNcVT8iDaCkvYsXKhA1AjbZxxf+BEuDea/RqNVwEj7pUQ
 cxJtZ6KPsFt52Y6/BfRRrJjEH8QbTsHDNFPhouRqikBUXI5FiX7YD9rHUXpTHX0TQ==

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
