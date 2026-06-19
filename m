Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7C230498E
	for <soc@lists.linux.dev>; Fri, 19 Jun 2026 13:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781877284; cv=none; b=Azk19C4D4O3WS6mY5m5PPgCKf7psn/kGO7CNKZNidHZ16e6BPU7xv00hLihCdYVeDI4YFnMTaYAOlmRlL7XE1BM9wQ09GQtUCjU8v6Ya/eqa3CTNrq/faNdMAHRH1d6N33ioZJuF90iDhhxxdf01GaJYPjdG54u2ksI4qCOtdC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781877284; c=relaxed/simple;
	bh=r4XLIPU7DmrQYWkVnd061xM3DzeraiEWiBBApibhNsk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=AN4bn+HyxlaPzaJQ6RvxBQ2bD8K+dbp77iFvwCPqMqLjyGdfLBhuJKdXMm5Gr2Ke5HqaZhEaRQ/rt6Ay5r9YadL4Q4MB/7h7Agjyy91D6i+4+VyZgl5cjkc4J4JwpgvdyLVY69vDugjx+IqheZHGttE6TYBQ1m0BiO6f8sD8Ax4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=X/Xb0wZe; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=SCAYL4Cx; arc=none smtp.client-ip=103.168.172.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="X/Xb0wZe";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="SCAYL4Cx"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id A892DEC02DA;
	Fri, 19 Jun 2026 09:54:36 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Fri, 19 Jun 2026 09:54:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781877276;
	 x=1781963676; bh=fGhiVMwPkreKp0vHZtTTCkMwKPr/e26nfYjRzDJCX+8=; b=
	X/Xb0wZeFaM0bGpYpDvP8pANEC2yjPKnVlSUr9ZgEgfo830lYuQBlPc6mGy16c+b
	cilFtsdbYMh+KWTyasxrnwds6iVmOD41cvdWsMs2N61RgxuxaeKz097Bsq3ZRpxQ
	wlTgKuSQMMC13oD4g99LI7G5pPYpB5UObLVvMG0Ir/zhiPIKTc72ASdVoBV9zr/3
	qVn9SITEluBt3CcunzDMfKoX21EW5ZQFFZ/Os4J8tSNDvULGcYGUPn2DgJEOMjms
	v/Nb79rNu+6cUPrYXC1Zss9Muo5Rer3nhxnaKh0LVKsEu5wDjhWqXt4ifQWQyTjI
	vgI9YVgh/XUZM4kuWCc0dA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781877276; x=
	1781963676; bh=fGhiVMwPkreKp0vHZtTTCkMwKPr/e26nfYjRzDJCX+8=; b=S
	CAYL4Cx+YVlyZleyr1bqqCCzpLzx42CRoZgnq2C6k1MOSmVZc4toOD/v4XSbQRVP
	yn2v2ol8BTTuewgKl5FLLf4hqwM8sW3GO0GPJxO1gOAK1SN5xOuN8i2nBYDuA3It
	V3qkcDU1t56PUlG4d4bQkP57M+ICYz6miKH/D/NUIV4kYspN/fcEELrxd/QZ4kf4
	yrjCRJ2iTH6jo6p9Zx/OIsf0DxBpST02jrsllXyBonMwIG1VE5wup78TUQAiOPhd
	0qY6n3eM1uTg4ShqOpsmWKc9cspiKMotXN/Hw/6dxtGUE/RWSS7lqCkM4IjTUz7a
	CxBPsG/ObM7TTD8Bvl1RQ==
X-ME-Sender: <xms:G0o1aoYysvl-fdnI-BXvdvagZEaqODokYW7Y1xV_5kZnARpQ7tN1vw>
    <xme:G0o1auO6Wg0GCnV2GKK3XxLmXszdPhwIG83cp0eUv3c1HnSp5Za2ZoyLGEDCfKY0c
    Yfe7IvX15_Ylzpb_0tMPSH1ZvIgNhHFPFY3K9L3LMCR1naz9fltXXk>
X-ME-Proxy-Cause: dmFkZTEME0i7hFkUzbVaA8Blwt5lFCClrIVHk96pidkFC9CoLs+NZJibpKcjbdNBA/GqX8
    OHotBRwN4B+uk6gSRtG+lr75wy4a+ISIQwYbSV/CmUPmE+2mpxozY6dZmXz/gERBe103Do
    7+iYxl+TaJCGq0xHkKbuwM5nVV8WfGGE0KKSi1f5fNL1pgTP27kyDx5j63funhXxCCjvaK
    V1enqJePl7rsfllgQ9spD886+NhEoX66pi/pIWtKFWKNKJQfHvvPSg1NrKc0qqSDSd+XoN
    lvr6nqNjvbwteNjhLvaOhJ6szLcVXiA15ZIpT6RcNIBa3kzt5pz+HG3EOqK0HosibjZ1Py
    oswmHTM7d7SEXsMQaCPrj1M/c2V0hy1ehtY8WHPF3NwtnWBaDJIdNsrTcNyqxsESLr2ygn
    QAKne8sW2HU5WzygNyHY25puYkS1iXkaK1V1WfSaYwJYBl6CZgtvgJcpSmDY0CexOykhk0
    wwHADwhoLi+09pnKWjwA2lG2grCL6GasZ7CWbz95S+jXVxA2fWT26WnFLFzv9dNXJD3wqt
    3HodDyNM9nfYq9x4cIL6O3rO9a2QSBXK49vdy/OcAG7rvCYHPLbCJW0GuQVuxm8cK6an/A
    1atTaIworsTj5eEpJcx1Lvs+5yNUgRktkdmyvyXkpCH4Tc/NaXXcbqPBvz5A
X-ME-Proxy: <xmx:G0o1aqliEpSFMCeC89Vs9PfUKGS42VFMY4zD2oKDMjgtbTJ2sngMFQ>
    <xmx:HEo1agFevHRJyitLqWnp2jlpQQ-zLSZbIiVhu47qb3NVzMDrRNaiOQ>
    <xmx:HEo1ah8w42448NXmDmaNiwzo5cSfFStKqN5hzjX8j1XshJ_8y65lWw>
    <xmx:HEo1ahkqcIlzM-ywGLrKFHohqI7tOpaHjG-L3HoXCPO3MVuNticokQ>
    <xmx:HEo1ahoV06yv9yBqHeyXpjBFZxRFT2-iOLIOagdnfxLjelKQsweA3FVP>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id DF18E182007E; Fri, 19 Jun 2026 09:54:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ThreadId: A94YXJhgp2v7
Date: Fri, 19 Jun 2026 15:54:15 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Krzysztof Kozlowski" <krzysztof.kozlowski@oss.qualcomm.com>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Linus Walleij" <linusw@kernel.org>, "Drew Fustini" <fustini@kernel.org>,
 soc@lists.linux.dev
Message-Id: <b04972c7-2c5e-40fe-a8a6-7ade300cd4b2@app.fastmail.com>
In-Reply-To: <ed070807-d2dd-4f0b-9ba1-8d2c8c93c30e@oss.qualcomm.com>
References: <20260429-defconfig-v2-0-e4ed4186028b@oss.qualcomm.com>
 <20260429-defconfig-v2-4-e4ed4186028b@oss.qualcomm.com>
 <CAMuHMdVH6-5ZAjTyF3m=wF5-XiSDqwcgRhZWxJv6y0FoCnk4MA@mail.gmail.com>
 <ed070807-d2dd-4f0b-9ba1-8d2c8c93c30e@oss.qualcomm.com>
Subject: Re: [PATCH v2 4/5] arm64: defconfig: Drop unused Ethernet vendors
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Jun 19, 2026, at 15:11, Krzysztof Kozlowski wrote:
> On 19/06/2026 12:12, Geert Uytterhoeven wrote:
>>> +# CONFIG_NET_VENDOR_ACTIONS is not set
>>> +# CONFIG_NET_VENDOR_ADAPTEC is not set
>>> +# CONFIG_NET_VENDOR_AGERE is not set
>>> +# CONFIG_NET_VENDOR_ALACRITECH is not set
>>> +# CONFIG_NET_VENDOR_ALLWINNER is not set
>> 
>> [...]
>> 
>> I am not sure this new policy is a good idea: none of this affects
>
> I would not call it new policy. Just an idea which got accepted. :)

I think when we originally added the CONFIG_NET_VENDOR_xxx symbols,
the idea would be that we would one day change them to
default-disabled, but that never happened, and generally causes
more problems than it solves.

      Arnd
