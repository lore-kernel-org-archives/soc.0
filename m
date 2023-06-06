Return-Path: <SRS0=nKH+=B2=gmail.com=guptarud@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6011C7EE23
	for <soc@archiver.kernel.org>; Tue,  6 Jun 2023 02:48:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id AD1D6C4339C; Tue,  6 Jun 2023 02:48:23 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6ED4FC433D2;
	Tue,  6 Jun 2023 02:48:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6ED4FC433D2
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-3f82c0cdd02so51130991cf.3;
        Mon, 05 Jun 2023 19:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686019701; x=1688611701;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ii0fg77US/518xlxOEKIJghiUHbirfwTQhyyLf4nwFk=;
        b=YkUAc4TC3M1Q7pCTfVYgwp8p3uTUDeIiMRqCzgyoTa20P97S9RC/mGarXO0x4BSSRh
         zJUCmjcmXzeWkdsz5eWNhwLbAnyd9uZ63+6M06ZchzkuB7402BsLgArOsvMD6fNoPU7X
         g8fzbr7P5Z+UDsMCLfX+sQx3x7VlTu1j3+/2JuYdGglYDMV5VZUKwZRCKUX4LXo168L6
         0wm0kqgDbVsl2/jr6Uy8CgZrOk4qGYN6g7+ySMFx91USPVed0qLGFzhKt9vo9NGVb8dT
         Y0NAQeZcnofVfCeS2KrGQnEyN6FvE9VshL7k6yBJEMLkzRR/tRtel8AVdWX8NDTADjyU
         wabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686019701; x=1688611701;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ii0fg77US/518xlxOEKIJghiUHbirfwTQhyyLf4nwFk=;
        b=YKz4cmtTd1YQNna0wmPpH2TzjuuV95MRQSGOGNW+NPcxKbI38sO9wxlEUa5pzTKmh7
         57EcPe6hN1Bp5mlrkmebHCfAIagnMPZL/VV8blvzdOiBAdF5nTjOCMBi5PT8/X67ReWV
         AFXZxRm27dnmfT8IH5zUIOF1Db4ijs9AqN000qWgS32olh7KhXwuej69bpDMvn/0yl86
         ACCTtrCYiag1AVbDDGK7nHExVIktC1aZAy/6Be7SkYAX8S7uMLkIcGimunXebPg5cPIc
         +zCIGi2iDe+rBuWtzrf5Ij/8aWkgC9NcRSBGnZk30q0DOhhZlOzi2UqW3B2nEK8MvXto
         CWvQ==
X-Gm-Message-State: AC+VfDyNTTbAdJRE98QQvmqhk7ocbKecZC3e9TYxCbDRQUhZh/mlkDlh
	xfRm6EYfq5ydywEZg/tfJyR3DTxBIYRrSQ==
X-Google-Smtp-Source: ACHHUZ6EocqF7qgJM5pijhVqVHXWobos6JTE51MNtne+mUY0p/4PNoR4T2eozOpHO56zeFS1sz/hBw==
X-Received: by 2002:ac8:7d52:0:b0:3ef:4100:cd0c with SMTP id h18-20020ac87d52000000b003ef4100cd0cmr718727qtb.63.1686019701039;
        Mon, 05 Jun 2023 19:48:21 -0700 (PDT)
Received: from localhost ([2600:4040:2007:9800:ab:4faa:880f:7b91])
        by smtp.gmail.com with ESMTPSA id h22-20020ac846d6000000b003ef2db16e72sm5186302qto.94.2023.06.05.19.48.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 19:48:20 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 05 Jun 2023 22:48:18 -0400
Message-Id: <CT583OP69XTU.3E141NE263OR3@Latitude-E6420>
Cc: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 2/4] dt-bindings: phy: qcom,usb-hs-phy: Add
 compatible
From: "Rudraksha Gupta" <guptarud@gmail.com>
List-Id: <soc.lore.kernel.org>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>, "Andy Gross"
 <agross@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>, "Konrad
 Dybcio" <konrad.dybcio@linaro.org>, "Rob Herring" <robh+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Vinod Koul" <vkoul@kernel.org>, "Kishon Vijay
 Abraham I" <kishon@kernel.org>, "Arnd Bergmann" <arnd@arndb.de>, "Olof
 Johansson" <olof@lixom.net>, <soc@kernel.org>
X-Mailer: aerc 0.8.2
References: <20230604063032.365775-1-guptarud@gmail.com>
 <20230604063032.365775-3-guptarud@gmail.com>
 <3c781ae6-4a45-1d6d-840c-d25f33684b00@linaro.org>
In-Reply-To: <3c781ae6-4a45-1d6d-840c-d25f33684b00@linaro.org>

On Sun Jun 4, 2023 at 6:30 AM EDT, Krzysztof Kozlowski wrote:
> On 04/06/2023 08:30, Rudraksha Gupta wrote:
> > Adds qcom,usb-hs-phy-msm8960 compatible
> >=20
> > Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> > ---
> >  Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml=
 b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
> > index aa97478dd016..63b6914993fe 100644
> > --- a/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
> > +++ b/Documentation/devicetree/bindings/phy/qcom,usb-hs-phy.yaml
> > @@ -13,7 +13,9 @@ if:
> >    properties:
> >      compatible:
> >        contains:
> > -        const: qcom,usb-hs-phy-apq8064
> > +        items:
> > +          - const: qcom,usb-hs-phy-apq8064
> > +          - const: qcom,usb-hs-phy-msm8960
>
> I have no clue what you want to achieve here. You break the bindings.
When I added the USB node to the msm8960 dtsi file, I got similar
messages for the expressatt/cdp that Rob mentioned in his email reply:

phy: resets: [[25, 0]] is too short
phy: reset-names:0: 'phy' was expected
phy: reset-names: ['por'] is too short

I will send an updated patch soon that addresses this.

>
> It does not look like you tested the bindings, at least after quick
> look. Please run `make dt_binding_check` (see
> Documentation/devicetree/bindings/writing-schema.rst for instructions).
> Maybe you need to update your dtschema and yamllint.
>
> Best regards,
> Krzysztof
Sorry. I was only looking for expressatt errors/warnings and failed to
see the other errors/warnings in the sea of text.
