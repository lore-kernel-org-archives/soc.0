Return-Path: <pali@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9733C61DA4
	for <soc@archiver.kernel.org>; Thu,  9 Mar 2023 20:42:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9F9AEC433A0; Thu,  9 Mar 2023 20:42:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6687DC433D2;
	Thu,  9 Mar 2023 20:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678394568;
	bh=/Mk6SWiRb+cwyHUtQDhYsjqWsWJCRUZ+MLTg1mh/77E=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=JYMWzRVqWNb/aD9ZZuQJcLIBcDEn/Xcm4mcxCrO3Em3/dpHnYQmJ63O2xIdBJerhi
	 wXm0EETXA56NV33pGgPpJtPtZYw1x/VsZxBFZY4TMItOr3E/4tSfrNo3rDamE4opz/
	 SZoV0PF335wIPvCGKFSFHzRafJ2bdJROmza45Lk2d59AgZBs/D6DKGU88hbxO82YT8
	 M/WwAJ85p6pK4YLTLykgHEZyEgKyrEDLt/x/YRjGkrbxJJE5QcgzR7JnjMze8b+MQF
	 YGtgmCoz+kLM3+SxfLl4yYegCXnXJm4JalIfCQJfeAYLWOI+Nj5Cl+9mxwvsXwNPAL
	 bE/lc2BU1JiIA==
Received: by pali.im (Postfix)
	id A29C1CD5; Thu,  9 Mar 2023 21:42:45 +0100 (CET)
Date: Thu, 9 Mar 2023 21:42:45 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Lee Jones <lee@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH RESEND 4/8] dt-bindings: leds: Add
 cznic,turris1x-leds.yaml binding
Message-ID: <20230309204245.c2ni462ajcqukrtg@pali>
References: <20221226123630.6515-1-pali@kernel.org>
 <20221226123630.6515-5-pali@kernel.org>
 <Y9OypLjJb+O3yvhw@google.com>
 <98867251-1f59-fdc6-9535-49db7b24140a@kernel.org>
 <Y/iFnUAMl6YS1pSV@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y/iFnUAMl6YS1pSV@google.com>
User-Agent: NeoMutt/20180716

On Friday 24 February 2023 09:38:37 Lee Jones wrote:
> On Fri, 24 Feb 2023, Krzysztof Kozlowski wrote:
> 
> > On 27/01/2023 12:16, Lee Jones wrote:
> > > On Mon, 26 Dec 2022, Pali Rohár wrote:
> > > 
> > >> Add device-tree bindings documentation for Turris 1.x RGB LEDs.
> > >>
> > >> Signed-off-by: Pali Rohár <pali@kernel.org>
> > >> ---
> > >>  .../bindings/leds/cznic,turris1x-leds.yaml    | 118 ++++++++++++++++++
> > >>  1 file changed, 118 insertions(+)
> > >>  create mode 100644 Documentation/devicetree/bindings/leds/cznic,turris1x-leds.yaml
> > > 
> > > Needs a DT Ack (now Cc:ed)
> > 
> > Within the same day of posting v2 of this - just after 4 hours, Pali
> > received review and I pointed issue to address.
> > 
> > The issue was not addressed, just ignored.
> > 
> > Therefore this patch shall not be taken, until the issues are resolved
> > or discussion is finished if there is disagreement about my comments..
> 
> Understood.  Thanks for the clarification.

Sorry, but this discussion was ignored by the reviewer, not by me.
I have replied to all points. In other cases I have sent other emails
and result was same.

I'm not going to write and send emails or pull requests or other code to
people who do not want to read them or think that it is me who is
ignoring even it is false information.
