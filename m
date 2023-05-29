Return-Path: <SRS0=syZG=BS=gmail.com=guptarud@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AF16C7EE23
	for <soc@archiver.kernel.org>; Mon, 29 May 2023 22:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id D3486C4339E; Mon, 29 May 2023 22:28:09 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B3E47C433EF;
	Mon, 29 May 2023 22:28:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B3E47C433EF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6262be06e2eso3599766d6.1;
        Mon, 29 May 2023 15:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685399287; x=1687991287;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fgPfcW2qzSYYzj32tI9lcSdz/QlSOeix4/HDyUyUMRA=;
        b=WXyQx8aQBWSDxpOeNxCAXDmwEIdCd7q8nRQZ04cW2H+3B7mG/a4vl9iOgIZjcg6ytz
         0hGnsX9zpf0xYfzgwsRNKTMtUCgjg9qFi3UYLgOqHNpDWYsXWZ8FOo7XpeIlUNKJS61V
         E0G5QQSOfDMzMZYtH303E5ojY0oszovAaip3rfuEalmerSlPaOpsbYnp/FHGQrL8S4cM
         3IARp0bHAJkUWUol+AFm9AGgXAB7vrJJdz7BUA8mrfNl+5cawpqwAYqbn8IHSSHpspuP
         F22k8+iJ02kLM5Jk9SBBbrqZPDtpPumwR8fYYk6DQDV/t6YfSX6jtxIpm8EtGXUtvrzi
         21nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685399287; x=1687991287;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fgPfcW2qzSYYzj32tI9lcSdz/QlSOeix4/HDyUyUMRA=;
        b=FvkWyARWjY8e8Fbjo65kL3YPaOLaNfbE3rvTbVD1tJD+c+PYuJbLALCmndu1x1+gz8
         3ZYslhUxTZIzD5eDpGt7s5C7f6o5DN1Zqf84mB+2IygXo5j3Y9wars08XCzpx0UUsKEg
         aMiAlnMA4vcixbr4mRFoOud8fvwNqRFe5EJGzJvJ8L4L6OZ85UnSetcOzXdWMK/a91N7
         f0gOSkwubSKuM61Sw0yGqPDffYIyEI7xPdCBi5wbjdOr1PdXW0u7DBDBDnk0Bs8jNPQG
         BbXNFONYVUBG9NWvKSzJPKH0P/oK08tTShOBGnPDvFid1fXDt7O5fTLDBLyonb2AqSVg
         Mzrg==
X-Gm-Message-State: AC+VfDw0IDbztt1bO2z2n65HrL9+X0NvzGhU0qVahPyXmuU+1NrkAaEs
	y4YiQgfddBbAeFoW5y6PDK2aZC1VigE1/g==
X-Google-Smtp-Source: ACHHUZ6NZ/Bb2tKmL5ScmGagfAqrAKXSkCJ3jZfX24VBwNQu8zOzFD3nvvqEpeSZAnWUUXAccWEJ8Q==
X-Received: by 2002:a05:6214:1c09:b0:626:24aa:87ef with SMTP id u9-20020a0562141c0900b0062624aa87efmr47324qvc.62.1685399287544;
        Mon, 29 May 2023 15:28:07 -0700 (PDT)
Received: from localhost ([2600:4040:2007:9800:1794:1f51:786e:6197])
        by smtp.gmail.com with ESMTPSA id t20-20020a0cea34000000b0062623d8ab7esm1215121qvp.111.2023.05.29.15.28.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 15:28:07 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 29 May 2023 18:28:05 -0400
Message-Id: <CSZ46N3I9GM7.NON5KMJ66OK5@Latitude-E6420>
List-Id: <soc.lore.kernel.org>
Cc: "Andy Gross" <agross@kernel.org>, "Bjorn Andersson"
 <andersson@kernel.org>, "Rob Herring" <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Vinod Koul" <vkoul@kernel.org>, "Kishon Vijay
 Abraham I" <kishon@kernel.org>, "Arnd Bergmann" <arnd@arndb.de>, "Olof
 Johansson" <olof@lixom.net>, <soc@kernel.org>,
 <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: arm: qcom: Add Samsung Galaxy
 Express
From: "Rudraksha Gupta" <guptarud@gmail.com>
To: "Konrad Dybcio" <konrad.dybcio@linaro.org>, "Conor Dooley"
 <conor@kernel.org>
X-Mailer: aerc 0.8.2
References: <20230527040905.stmnoshkdqgiaex6@ripper>
 <20230528001010.47868-2-guptarud@gmail.com>
 <20230528-decode-creasing-f5b3996163e5@spud>
 <ad7a6ee3-cabb-6f92-a595-8791801cfe97@gmail.com>
 <a8d3d68d-d202-ddba-3289-65b347807538@linaro.org>
In-Reply-To: <a8d3d68d-d202-ddba-3289-65b347807538@linaro.org>

On Mon May 29, 2023 at 3:41 AM EDT, Konrad Dybcio wrote:
>
>
> On 28.05.2023 15:36, Rudraksha Gupta wrote:
> >> Where did the "att" come from in the compatible. Is this some carrier =
specific model of the phone?
> >=20
> > This is the code name for the device. Since there are usually multiple =
variants of a device, using the code name differentiates between those vari=
ants. For example, if I left this as "samsung,express", it would be unclear=
 if I am referring to the GT-I8730 (code name: expresslte) or the SGH-I437 =
model. This is typically done in postmarketOS: https://wiki.postmarketos.or=
g/wiki/Devices and XDA developers. I believe it is a carrier specific model=
 of the Samsung Galaxy Express.
> >=20
>
> Please fix your email client:
>
> - wrap each line at about 80 characters
> - don't trim messages unless they're very long or
>   there's some other good reason
> - Don't send v(n+1) as a reply to v(n), send it in a
>   separate thread.
>
Gotcha, I will do that next time. Should I still send v2 in a separate
thread? Not sure if I should as I don't want to spam anyone.

>
>
> Konrad

