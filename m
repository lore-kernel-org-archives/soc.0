Return-Path: <gregkh@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF8DC433EF
	for <soc@archiver.kernel.org>; Tue, 17 May 2022 09:57:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 88113C34100; Tue, 17 May 2022 09:57:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96143C385B8;
	Tue, 17 May 2022 09:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1652781477;
	bh=IiRJjXYntOY87dWgcQSnWWlomvS0FwKI8GcHSCfKvl8=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=KrfBYju2EyMwh1RbXNd9PdXwDhjC64rfNPGYVi0Kf7ivqkJuKtKfW9tfjxRtpH5NA
	 ujRVCwL/inq/6fUkfzLlTi4wdqil9Hus5/cevW6OXOkfnfcceV/5wb2N9jY9v30plI
	 AX1aout1cb5tXi/zpEZFgYu4ChEKRlGvU02xLbbI=
Date: Tue, 17 May 2022 11:57:53 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
List-Id: <soc.lore.kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Manu Gautam <mgautam@codeaurora.org>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	USB list <linux-usb@vger.kernel.org>, arm-soc <soc@kernel.org>
Subject: Re: [PATCH 00/13] dt-bindings/arm64: dts: qcom: minor cleanups with
 DT schema
Message-ID: <YoNxoUwjJIxyAi3l@kroah.com>
References: <20220504131923.214367-1-krzysztof.kozlowski@linaro.org>
 <CAMuHMdVc3kShpp8wieX1SSA8-37m8PbxpqKRs5+gxz8Dm6QwsA@mail.gmail.com>
 <3bdb65cd-cdad-6e10-c921-5ec3a9b4c9dd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bdb65cd-cdad-6e10-c921-5ec3a9b4c9dd@linaro.org>

On Tue, May 17, 2022 at 11:27:39AM +0200, Krzysztof Kozlowski wrote:
> On 17/05/2022 11:19, Geert Uytterhoeven wrote:
> > On Wed, May 4, 2022 at 5:13 PM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >> The patches are independent, so they can be picked up as is (or everything
> >> through Qualcomm SoC tree).
> >>
> >> Best regards,
> >> Krzysztof
> >>
> >> Krzysztof Kozlowski (13):
> >>   dt-bindings: soc: qcom: aoss: document qcom,sm8450-aoss-qmp
> >>   dt-bindings: soc: qcom: qcom,smd-rpm: add power-controller
> >>   dt-bindings: usb: qcom,dwc3: add IPQ8074, MSM8994, QCS404 and SM6125
> >>   dt-bindings: usb: qcom,dwc3: fix clock matching
> >>   arm64: dts: qcom: add missing AOSS QMP compatible fallback
> >>   arm64: dts: qcom: correct DWC3 node names and unit addresses
> >>   arm64: dts: qcom: ipq8074: add dedicated qcom,ipq8074-dwc3 compatible
> >>   arm64: dts: qcom: msm8994: add dedicated qcom,msm8994-dwc3 compatible
> >>   arm64: dts: qcom: sm6125: add dedicated qcom,sm6125-dwc3 compatible
> >>   arm64: dts: qcom: qcs404: add dedicated qcom,qcs404-dwc3 compatible
> >>   arm64: dts: qcom: msm8996: add clock-names to DWC3 USB node
> >>   arm64: dts: qcom: align DWC3 USB clocks with DT schema
> >>   arm64: dts: qcom: align DWC3 USB interrupts with DT schema
> > 
> > Looks like all but the first two were applied to usb-next by Greg,
> > causing conflicts with the soc/for-next tree.
> 
> Also this one was not applied:
> arm64: dts: qcom: add missing AOSS QMP compatible fallback
> 
> However I did not get any conflict message...
> 
> The DTS patches should not go via Greg's tree. They are sent together so
> there will be no warnings from Rob's bot. This is a common practice for
> dt-binding fixes.
> 
> Bjorn,
> Any preference from you? Shall I send missing three patches to you?
> 
> What about conflicts with Greg's tree?

If I need to revert anything from my tree, please let me know.  Trying
to figure out who should, and should not, take patches like this is
driving me crazy...

thanks,

gre gk-h
