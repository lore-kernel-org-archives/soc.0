Return-Path: <robh+dt@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C07FC001E0
	for <soc@archiver.kernel.org>; Wed, 19 Jul 2023 17:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 1A161C43395; Wed, 19 Jul 2023 17:40:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01D84C433C8;
	Wed, 19 Jul 2023 17:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689788450;
	bh=bChidrtaDy1rbd++QuYPIlvP+FIGQW/eD6lxV+YbEgc=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=G2ES70HbQiMWitc5t2ygkwox/3zRGeZfxJxf6V7UIyxsA4vvuprgVmmoH4LT/6Cpz
	 4ibaaN+8GouBNrD0dsycyOynJLDh6W/CHcQw0uaasthzfHON6t2zNixzEevRrcyFE5
	 RKwSvIEFmBD5QFBh5KFMkF9lzxpckht6o4xqD/OasnnHfPRnb0HqQg2nH75ly4TM7q
	 G2Oaf0nHsXTZ1TGCox4+sHYTUn6C+zQMZdOJeupxx5QvJW66Xlfb/a1dC1o2CU3LVy
	 xJW24WZAftXeqLB0pjBdRTUlC5jcQioF5tjVR25MMLycf9+LdeozHHQ9eWrahTagJS
	 Me20zRiNA4pvw==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2b701e1ca63so111172201fa.1;
        Wed, 19 Jul 2023 10:40:49 -0700 (PDT)
X-Gm-Message-State: ABy/qLZj0TZsKXvksc9dNjUmeuPAz+rjmUpMBS33IXbWy5SyyJS5wrM3
	8iX7o5WAhsi0XkEPWeF4BZExsWYgZEwYWMpHkQ==
X-Google-Smtp-Source: APBJJlEdvUYfCdiWTFtyIrl5uwdLZGFUk9smsZwtRTn6LUcjHrO7fXQ2jc9drQ1qAAVAtOdMI6V5KRKwN579HjdQ8Xw=
X-Received: by 2002:a2e:8ece:0:b0:2b9:53bd:47a7 with SMTP id
 e14-20020a2e8ece000000b002b953bd47a7mr437606ljl.30.1689788448010; Wed, 19 Jul
 2023 10:40:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230719143309.204766-1-krzysztof.kozlowski@linaro.org> <20230719143309.204766-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230719143309.204766-2-krzysztof.kozlowski@linaro.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 19 Jul 2023 11:40:35 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLXanpk+cMG0b8Ze9WAfmRqcu6-5EsdKVKG3TKCOwnm7A@mail.gmail.com>
Message-ID: <CAL_JsqLXanpk+cMG0b8Ze9WAfmRqcu6-5EsdKVKG3TKCOwnm7A@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] Documentation/process: maintainer-soc: add clean
 platforms profile
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, soc@kernel.org, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, arm@kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 19, 2023 at 8:33=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Some SoC platforms require that commits must not bring any new
> dtbs_check warnings.  Maintainers of such platforms usually have some
> automation set, so any new warning will be spotted sooner or later.
> Worst case: they run the tests themselves.  Document requirements for
> such platforms, so contributors can expect their patches being dropped
> or ignored, if they bring new warnings for existing boards.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>
> ---
>
> Changes in v2:
> 1. Add Rb tag.
> 2. Implement Conor's feedback: change doc title, follow->should follow,
>    minor style changes.
> ---
>  .../process/maintainer-handbooks.rst          |  1 +
>  .../process/maintainer-soc-clean-dts.rst      | 23 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 25 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/process/maintainer-soc-clean-dts.rst
>
> diff --git a/Documentation/process/maintainer-handbooks.rst b/Documentati=
on/process/maintainer-handbooks.rst
> index 9992bfd7eaa3..976391cec528 100644
> --- a/Documentation/process/maintainer-handbooks.rst
> +++ b/Documentation/process/maintainer-handbooks.rst
> @@ -17,5 +17,6 @@ Contents:
>
>     maintainer-netdev
>     maintainer-soc
> +   maintainer-soc-clean-dts
>     maintainer-tip
>     maintainer-kvm-x86
> diff --git a/Documentation/process/maintainer-soc-clean-dts.rst b/Documen=
tation/process/maintainer-soc-clean-dts.rst
> new file mode 100644
> index 000000000000..c460923f39be
> --- /dev/null
> +++ b/Documentation/process/maintainer-soc-clean-dts.rst
> @@ -0,0 +1,23 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +SoC Platforms with DTS Compliance Requirements
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Overview
> +--------
> +
> +SoC platforms or subarchitectures should follow all the rules from
> +Documentation/process/maintainer-soc.rst.  However platforms referencing
> +this document impose additional requirements listed below.

I would make it clear how platforms reference this doc:
this document in MAINTAINERS impose...

> +
> +Strict DTS DT Schema Compliance

Schema and dtc


> +-------------------------------
> +
> +No changes to the SoC platform Devicetree sources (DTS files) should int=
roduce
> +new ``make dtbs_check W=3D1`` warnings.  The platform maintainers have a=
utomation
> +in place which should point out any new warnings.

If a soc.dtsi file has warnings a new board.dts will duplicate all
those warnings. I imagine those are okay? Or are we assuming soc.dtsi
is warning free? Or do we need to distinguish both cases?

I would like to see a build target for the warning free platforms, so
we can easily run it and check for no warnings. Just hasn't been
enough platforms yet to do that.

> +
> +If a commit introducing new warning gets accepted somehow, the resulting=
 issues
> +shall be fixed in reasonable time (e.g. within one release) or the commi=
t
> +reverted.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ba5e7344f30e..a70c32790427 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1573,7 +1573,7 @@ S:        Maintained
>  P:     Documentation/process/maintainer-soc.rst
>  C:     irc://irc.libera.chat/armlinux
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git
> -F:     Documentation/process/maintainer-soc.rst
> +F:     Documentation/process/maintainer-soc*.rst
>  F:     arch/arm/boot/dts/Makefile
>  F:     arch/arm64/boot/dts/Makefile
>
> --
> 2.34.1
>
