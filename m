Return-Path: <jic23@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1505C76196
	for <soc@archiver.kernel.org>; Sat,  1 Apr 2023 15:23:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 52490C433EF; Sat,  1 Apr 2023 15:23:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D30A0C433D2;
	Sat,  1 Apr 2023 15:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680362607;
	bh=Fi/bBSEGuSvZZ1SJybMI04OJr1M6NXLuuJk/0lVWYno=;
	h=Date:From:To:List-Id:Cc:Subject:In-Reply-To:References:From;
	b=iH43BkSGOToEm6xuBaUVkPDfoAn++n8oUXoRfKuLaVA307pKXzSINgK/Va8XqZ+gH
	 RibdMVJf91a4k+vWMAfoiQtn/EpqEhfUKksqNInd7UiI/MM3vT6Wk48Y8PnBR7AsKt
	 AztH9ipTzzetFtelxfOAVA6rQsT7d4onHE5BsTeL3nvJRQoOoGG2hcLU2/a3z1AMKM
	 k1NzyVSbq7fuB+TRJNYHpUhHGDqITiFZUSWsW/gxQT9b4bNWIqy3M8OE3ToRDBwRzL
	 rj3aEAsWO0mEhzzsstAuEFDDzrzmRK68FzR3n3G2HOuBopXX38nb96WPsvZFg1L8Z9
	 7mIeoEvghNYPw==
Date: Sat, 1 Apr 2023 16:38:33 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Stefan Wahren <stefan.wahren@i2se.com>
List-Id: <soc.lore.kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Stefan Wahren
 <stefan.wahren@chargebyte.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Lars-Peter Clausen
 <lars@metafoo.de>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson
 <olof@lixom.net>, Evgeniy Polyakov <zbr@ioremap.net>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, linux-imx@nxp.com, Li Yang <leoyang.li@nxp.com>,
 Denis Ciocca <denis.ciocca@st.com>, soc@kernel.org,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH V2 4/8] dt-bindings: iio: st-sensors: Add IIS328DQ
 accelerometer
Message-ID: <20230401163833.18c334ed@jic23-huawei>
In-Reply-To: <1585c36f-cb8e-55ee-ac30-766feceda09f@i2se.com>
References: <20230317103323.7741-1-stefan.wahren@chargebyte.com>
	<20230317103323.7741-5-stefan.wahren@chargebyte.com>
	<20230318155534.16b47583@jic23-huawei>
	<708b63c9-d2b6-c65f-0112-8f50173c0bca@linaro.org>
	<20230319154257.68facd30@jic23-huawei>
	<1585c36f-cb8e-55ee-ac30-766feceda09f@i2se.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 27 Mar 2023 12:57:10 +0200
Stefan Wahren <stefan.wahren@i2se.com> wrote:

> Hi Jonathan,
> 
> Am 19.03.23 um 16:42 schrieb Jonathan Cameron:
> > On Sun, 19 Mar 2023 13:40:49 +0100
> > Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> >   
> >> On 18/03/2023 16:55, Jonathan Cameron wrote:  
> >>> On Fri, 17 Mar 2023 11:33:19 +0100
> >>> Stefan Wahren <stefan.wahren@chargebyte.com> wrote:
> >>>      
> >>>> The ST IIS328DQ is an accelerometer sensor, which is compatible with
> >>>> the already supported ST H3LIS331DL. So add the new compatible
> >>>> with a fallback to the ST sensor binding.
> >>>>
> >>>> Link: https://lore.kernel.org/linux-iio/2bac9ecf-9d2e-967e-9020-1c950487d781@i2se.com/
> >>>> Suggested-by: Jonathan Cameron <jic23@kernel.org>
> >>>> Signed-off-by: Stefan Wahren <stefan.wahren@chargebyte.com>	
> >>>> ---
> >>>>   Documentation/devicetree/bindings/iio/st,st-sensors.yaml | 3 +++
> >>>>   1 file changed, 3 insertions(+)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/iio/st,st-sensors.yaml b/Documentation/devicetree/bindings/iio/st,st-sensors.yaml
> >>>> index c6201976378f..5eb71b24a7cb 100644
> >>>> --- a/Documentation/devicetree/bindings/iio/st,st-sensors.yaml
> >>>> +++ b/Documentation/devicetree/bindings/iio/st,st-sensors.yaml
> >>>> @@ -48,6 +48,9 @@ properties:
> >>>>             - st,lsm330d-accel
> >>>>             - st,lsm330dl-accel
> >>>>             - st,lsm330dlc-accel
> >>>> +      - items:
> >>>> +          - const: st,iis328dq
> >>>> +          - const: st,h3lis331dl-accel  
> >>>
> >>> Hmm. So this separates the particular 'oneOf' group from the description
> >>> associated with the ST accelerometers.
> >>>
> >>> DT experts, is there a better way to do this?  Ideally we'd also associate
> >>> other similar groups going forwards so it might become less and less obvious
> >>> how the groupings work. (bit late for the many groups that exist
> >>> already in that list above this point).  
> >>
> >> If by "grouping" you mean how the oneOf items are organized with
> >> descriptions, I wouldn't put too much attention to it. You can add some
> >> '#' comments to separate the groups, but for me this is still readable.
> >>
> >> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>  
> > 
> > Works for me. Thanks for quick response!  Applied this and next patch
> > to the togreg branch of iio.git  
> 
> Shawn had some comments to patch #7. Just to make it clear, there is no 
> need to resend patch 4 and 5 in V3?
> 
> Best regards
> 
Yes. They will work their way through the IIO tree to upstream whilst
other bits go via appropriate routes.

Jonathan

> > 
> > 
> > Thanks,
> > 
> > Jonathan
> >   
> >>
> >> Best regards,
> >> Krzysztof
> >>  
> > 
> > 
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel  

