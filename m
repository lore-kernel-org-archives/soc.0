Return-Path: <krzk@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737F2C61DA4
	for <soc@archiver.kernel.org>; Sat, 11 Mar 2023 11:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 32FE0C4339B; Sat, 11 Mar 2023 11:47:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54A0DC433EF;
	Sat, 11 Mar 2023 11:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678535237;
	bh=WB0aXoCELGk1L5NujN0Fk0ky0ld81nb2Zr/7tSN08I0=;
	h=Date:Subject:To:List-Id:Cc:References:From:In-Reply-To:From;
	b=ir9Br0svLBeilWwNZJp9MDsXtrAUCnKd60DVQSZVUy0+O+axIvXDDn+c3E1IBaJ8U
	 mDM0qd731xESxHMr8hGBhniQl5794hMrfd1jj9oh5tW0PKg2QETuQJUhQ2ahE/2CJI
	 YpPtJkFM3Xr2pk+vlQd5WSQWOZEVIwPP8GqUzCkakPaOwqfWhynZzgyQnM8WV8HY6Y
	 Tw6H8XzvrPC26dPwV66QISSDd6A/Ra+ISeClfnIfIDbehcGiY59gBsEHRqwgHho3m2
	 VMjwdykuADEcO7XDWi7kSxWQQQ3SZ5i4m67YWEK9HEBWbLAk+2ytwN1Ji7vlGzX+bi
	 O8ut9uTplgtpg==
Message-ID: <bbd46675-5177-0463-1f99-bf5053988b43@kernel.org>
Date: Sat, 11 Mar 2023 12:47:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH RESEND 4/8] dt-bindings: leds: Add
 cznic,turris1x-leds.yaml binding
Content-Language: en-US
To: =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>, Lee Jones <lee@kernel.org>
List-Id: <soc.lore.kernel.org>
Cc: soc@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linus.walleij@linaro.org>
References: <20221226123630.6515-1-pali@kernel.org>
 <20221226123630.6515-5-pali@kernel.org> <Y9OypLjJb+O3yvhw@google.com>
 <98867251-1f59-fdc6-9535-49db7b24140a@kernel.org>
 <Y/iFnUAMl6YS1pSV@google.com> <20230309204245.c2ni462ajcqukrtg@pali>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230309204245.c2ni462ajcqukrtg@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 09/03/2023 21:42, Pali Rohár wrote:
> On Friday 24 February 2023 09:38:37 Lee Jones wrote:
>> On Fri, 24 Feb 2023, Krzysztof Kozlowski wrote:
>>
>>> On 27/01/2023 12:16, Lee Jones wrote:
>>>> On Mon, 26 Dec 2022, Pali Rohár wrote:
>>>>
>>>>> Add device-tree bindings documentation for Turris 1.x RGB LEDs.
>>>>>
>>>>> Signed-off-by: Pali Rohár <pali@kernel.org>
>>>>> ---
>>>>>  .../bindings/leds/cznic,turris1x-leds.yaml    | 118 ++++++++++++++++++
>>>>>  1 file changed, 118 insertions(+)
>>>>>  create mode 100644 Documentation/devicetree/bindings/leds/cznic,turris1x-leds.yaml
>>>>
>>>> Needs a DT Ack (now Cc:ed)
>>>
>>> Within the same day of posting v2 of this - just after 4 hours, Pali
>>> received review and I pointed issue to address.
>>>
>>> The issue was not addressed, just ignored.
>>>
>>> Therefore this patch shall not be taken, until the issues are resolved
>>> or discussion is finished if there is disagreement about my comments..
>>
>> Understood.  Thanks for the clarification.
> 
> Sorry, but this discussion was ignored by the reviewer, not by me.
> I have replied to all points. In other cases I have sent other emails
> and result was same.
> 
> I'm not going to write and send emails or pull requests or other code to
> people who do not want to read them or think that it is me who is
> ignoring even it is false information.

Why did you trim the reply list from few folks and from me, even though
discussion is about review between you and me? You had to do it
deliberately, so I wonder why?

OK, you claim this is false information.

This is the last feedback from me:
https://lore.kernel.org/all/ebf5029e-83fd-e50d-b7cb-eae1b64f7145@linaro.org/

Where did you respond to this feedback? Point me to the message which
responds to my review comment about messed indentation?

Best regards,
Krzysztof

