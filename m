Return-Path: <SRS0=nKH+=B2=gmail.com=guptarud@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15171C7EE2E
	for <soc@archiver.kernel.org>; Tue,  6 Jun 2023 02:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id C7792C4339B; Tue,  6 Jun 2023 02:06:28 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8FDBEC433EF;
	Tue,  6 Jun 2023 02:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8FDBEC433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6261d4ea5f0so41307066d6.0;
        Mon, 05 Jun 2023 19:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686017186; x=1688609186;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHxYxgoeO4Fz6rNQej/wSf+qvSfbEPqyAolfpowpldM=;
        b=acthjTFnSNF5zKRRlhGw+vu3sBJkQfXpmpXAoiZAvL7d24CZE6ZABgRhPubR/9PFEU
         bM3XFVjFd+D8kAZrZs7FwT4ohc3FMIDX1HcpQm8G+1XhEY90fk+RYl2XPyTMNrWGt/UT
         dOCFIn0mguhJ4RgtpFXtp6JsxXig1i41Z09BWYzkjB9kabDK/K2KA8VgVB+aD+qNcG2N
         cDjIs98Mnbc7YvvyGXtQZ8SttnUO0QJLWVkTTu4Tn7HSxf7K022xiC3UUy60PEyhy732
         hWNRKp6OLIYnq9iSZIbDk5MyDtr3YbSo0LHulc+HB3YEgGGJeu8oGFWGsZq+TvwahBXP
         X6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686017186; x=1688609186;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fHxYxgoeO4Fz6rNQej/wSf+qvSfbEPqyAolfpowpldM=;
        b=Jnj/v6HXSxlVyPYODkG2/gzNvgTbiSOwxwreC7vGkIkkdbtflcpSxOKRESXugM0KAW
         zYq8b9ZNZG/IPiWCD/KxZ6osbPqUI0CEbNOxgv68JuNeqXChQ8noYP+lGBQtdjY7QVW2
         M049zJcjqwo1IWCnzTUiWjMGj3TuDxs3jFC0kClSI4a95Q55YC3Rd1VO+6f6QF/6hUSL
         S2BQCbX7XIISyJbCmLOmu1wWynzCcJ5AI7ofmKBniwAyhsBy5ablPfdPITvbRxZrJ5nv
         5Y2oFLuSswiDPU03G3ZU/nQltTBvsLtGguci4Cq6++0S58xwOmY4jmSfA73Mdij3o2AJ
         uZkw==
X-Gm-Message-State: AC+VfDxjNkGREkLxo2Hyx9z3I4bvAde5567YChf6aJebHZOoQiWI7YWg
	eyJtrLEIo9d09fcxrIfjJE0HvgmvoSHUTw==
X-Google-Smtp-Source: ACHHUZ40R/7DwONJjQlPcqGT36cqBtgKGygl2J4alUiZu16uhr29ahIhA1q8+RczUQBCu26cwcVQvA==
X-Received: by 2002:a05:6214:f25:b0:623:a5d0:1daf with SMTP id iw5-20020a0562140f2500b00623a5d01dafmr767371qvb.48.1686017185826;
        Mon, 05 Jun 2023 19:06:25 -0700 (PDT)
Received: from localhost ([2600:4040:2007:9800:ab:4faa:880f:7b91])
        by smtp.gmail.com with ESMTPSA id v6-20020ad45286000000b006257e64474asm5022256qvr.113.2023.06.05.19.06.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 19:06:25 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Jun 2023 22:06:23 -0400
Message-Id: <CT577LF6NJLX.3OVACDQO6WGDE@Latitude-E6420>
From: "Rudraksha Gupta" <guptarud@gmail.com>
To: "Rob Herring" <robh@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: "Kishon Vijay Abraham I" <kishon@kernel.org>,
 <linux-phy@lists.infradead.org>, "Olof Johansson" <olof@lixom.net>, "Vinod
 Koul" <vkoul@kernel.org>, "Arnd Bergmann" <arnd@arndb.de>,
 <soc@kernel.org>, <devicetree@vger.kernel.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski+dt@linaro.org>,
 <linux-arm-kernel@lists.infradead.org>, "Rob Herring" <robh+dt@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <linux-kernel@vger.kernel.org>, "Konrad Dybcio"
 <konrad.dybcio@linaro.org>, "Andy Gross" <agross@kernel.org>,
 <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH v3 2/4] dt-bindings: phy: qcom,usb-hs-phy: Add
 compatible
X-Mailer: aerc 0.8.2
References: <20230604063032.365775-1-guptarud@gmail.com>
 <20230604063032.365775-3-guptarud@gmail.com>
 <168586340547.3052749.2763112173580157119.robh@kernel.org>
In-Reply-To: <168586340547.3052749.2763112173580157119.robh@kernel.org>

On Sun Jun 4, 2023 at 3:23 AM EDT, Rob Herring wrote:
>
> On Sun, 04 Jun 2023 02:30:19 -0400, Rudraksha Gupta wrote:
> > Adds qcom,usb-hs-phy-msm8960 compatible
> >=20
> > Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >=20
>
> My bot found errors running 'make DT_CHECKER_FLAGS=3D-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/p=
hy/qcom,usb-hs-phy.example.dtb: phy: resets: [[4294967295, 10], [1, 0]] is =
too long
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicet=
ree/bindings/phy/qcom,usb-hs-phy.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/p=
hy/qcom,usb-hs-phy.example.dtb: phy: reset-names:0: 'por' was expected
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicet=
ree/bindings/phy/qcom,usb-hs-phy.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/p=
hy/qcom,usb-hs-phy.example.dtb: phy: reset-names: ['phy', 'por'] is too lon=
g
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicet=
ree/bindings/phy/qcom,usb-hs-phy.yaml
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/202306=
04063032.365775-3-guptarud@gmail.com
>
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.
I see. Why is it off the latest rc1 and not off the latest commit?

>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your sch=
ema.
Thanks. I didn't see these errors as I was only looking for expressatt
binding errors.
