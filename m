Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C1723959B
	for <soc@lists.linux.dev>; Mon, 17 Mar 2025 12:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742213341; cv=none; b=b4nVWg5hZ7ZNWEVV1xcv3bGARPLYiZx6p+RFbR5LYW/sMS0iu04Uxox/f2mOEE7Augdz5sIrCvKSqJ4JLdyabgsN0Gol1iMyYd2gp7yWzFyuBaEr1bO1YuMxPP7BEKh3yVLYJyQKBYaL3UKzxTY/SO27zkmwRaIuNdjA6EaYf2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742213341; c=relaxed/simple;
	bh=fgKkev5GNis8u+sBMd7UBvRwmZ3uweOhIS9C30idRKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ecP5m8hfyfk6fCCtyG/+sUk1mTkLX/xANOiFL+5BsRjbt3OX/cvenSKVoyhgS/7lVbf6e6zPBwsKNZaa178xWFIRealw3zH5kFUq2ImEm84UG7RgjJo8GW1YG/BUuNzg7zp7dlDMEkTXxAi3wtvu1dvWgd3v/4liIca8JxyVe8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YEG+oB47; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YEG+oB47"
Received: by smtp.kernel.org (Postfix)
	id 80D10C4CEEF; Mon, 17 Mar 2025 12:09:00 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5A035C4CEE9
	for <soc@kernel.org>; Mon, 17 Mar 2025 12:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 5A035C4CEE9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742213338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dJPQeSME8GvdRg4e0/QcxZw7No+3gHVhzWB0lS12ve8=;
	b=YEG+oB47MywRitNJCFF7qVlCwq6yxCNcaoourI4Vpud519gPH1wM8BKwExWjGU5POxwylI
	dGQAujbl/XgjeJ7qpuaZbrqMlALeL5/k9VhRZXu33EnHoMaoC6ocQY6JwLNlx/3NaD81qC
	5wUHx53ov49kL7Qhm7D9efjVlag2TFg=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-b3dBCDpFN7ylOZFmTJHNzw-1; Mon, 17 Mar 2025 08:08:56 -0400
X-MC-Unique: b3dBCDpFN7ylOZFmTJHNzw-1
X-Mimecast-MFC-AGG-ID: b3dBCDpFN7ylOZFmTJHNzw_1742213336
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-5e636b06d34so1466099a12.1
        for <soc@kernel.org>; Mon, 17 Mar 2025 05:08:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742213335; x=1742818135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dJPQeSME8GvdRg4e0/QcxZw7No+3gHVhzWB0lS12ve8=;
        b=WTOdgJ2QKv9lU9zCTIS83hsnDdNw3m0ZzEkKNCy2hfv6cYgvoOGFKMCWKV9tRPc5vv
         3G/7ycy1Golbm6UCwc+c7kd4xI/kbo9FQPo75fy8pITSk2MDeAVI846ZK/ASSihqxRDs
         k0LN4zn4byLOgc2dO9HxlapnR/SZdT5x0ye5u1ZPFD5XFLj8V7kNyy9wSr3xG0dtZ6r7
         epD65sOq8NNhJjucp8hBMAilAKpt61+DktbXfc4p/tN3+qgkKHk/ULkqlbjRFqo4sXZq
         cyUWC/FeLxbRDu1//l9u0Ry3zXp5ntKpVkHZaYJwDivht5tHX1R98XLvhze6lsJC26Tg
         CyKg==
X-Forwarded-Encrypted: i=1; AJvYcCVRb6tNbrMl7dP8zZS0GndkzZhU/v1hF1oD1iGFEgdakNl2QZOLC7P7DCWMdDGJXwDyXRQ=@kernel.org
X-Gm-Message-State: AOJu0YwMn5rRXuByEuIW3wpMt25HEkbX0YzyAJQ8eauE10Hu1NxrE4YW
	cy7WEgysSYG33PnQcmGxMIB6HenLS6XZHC0FKtm0s1jm/CfwAx/SPs2F4C1oujt+w239uu2OPLv
	SJFxU5ulRyfVbpgXb7RC4qEYTuxcQQzdVPy/7l6I5hbQ=
X-Gm-Gg: ASbGncvawehv++KqYGDrogC5pfwO1beCmBoCquA70uanedDkEMuQS7n4G2pnYO6GJKx
	5oW24TPoeJBL4k9p5ldzq1X1JWuoFb7HGyI43syuRWBpDh7TifE/Khq+pSATdOnhNC0g6QU+ERw
	rjnwLBpd2QowWNCGaaAZBVaacRFOybFRWZl/KILqrG2eZJueFgGPC1M9NRfgg4xTRcZcOyfA5dd
	BD0gKODR1Vcd0EI0XEZC5SSj0zHHD5FXbrunS7QiyJ0+GqhVJ+cZ5M3jySOrUOMBb+/tt9MtuRA
	jFGnLLIfGDPsW6VWjyM=
X-Received: by 2002:a17:907:7251:b0:ac1:ecb5:7207 with SMTP id a640c23a62f3a-ac330301e93mr1164668666b.29.1742213335659;
        Mon, 17 Mar 2025 05:08:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEASQHm2+bhVpahCDmGzllaOZY//NhzMkpnMVSSXwheT0L/ool1AlnploYIuxInxifydvQX+Q==
X-Received: by 2002:a17:907:7251:b0:ac1:ecb5:7207 with SMTP id a640c23a62f3a-ac330301e93mr1164664766b.29.1742213335224;
        Mon, 17 Mar 2025 05:08:55 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146aeaa1sm652245866b.2.2025.03.17.05.08.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Mar 2025 05:08:54 -0700 (PDT)
Message-ID: <b59d649d-4354-4fab-91aa-865af5d747de@redhat.com>
Date: Mon, 17 Mar 2025 13:08:54 +0100
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1 0/2] platform: toradex: Add toradex embedded
 controller
To: Andy Shevchenko <andy@kernel.org>
Cc: Francesco Dolcini <francesco@dolcini.it>,
 Emanuele Ghidoli <ghidoliemanuele@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Francesco Dolcini <francesco.dolcini@toradex.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, soc@kernel.org,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20250313144331.70591-1-francesco@dolcini.it>
 <4596db59-51fc-4497-9e94-670e9533e7aa@redhat.com>
 <20250317100856.GC17428@francesco-nb>
 <bc3144b7-23c8-4b47-bdd8-c482b1a6d81d@redhat.com>
 <Z9gQMPjjCt9Rn4lH@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Z9gQMPjjCt9Rn4lH@smile.fi.intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aFYo3UUFCC58naLdS3NaNeQ5RjTnoGoiRzjBLDvpZqk_1742213336
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 17-Mar-25 13:06, Andy Shevchenko wrote:
> On Mon, Mar 17, 2025 at 11:39:14AM +0100, Hans de Goede wrote:
>> On 17-Mar-25 11:08, Francesco Dolcini wrote:
> 
> ...
> 
>> But if Andy and Ilpo are happy to take this as a more monolithic
>> driver under drivers/platform/aarch64 I'm not going to nack that
>> approach.
> 
> I'm okay with the choice as long as it's suffice the purpose.
> I agree that aarch64 maybe not a good choice after all, but
> we should start from somewhere. Later on we can move to agnostic
> folder if needed. The question here is more about MFD/not-MFD.
> If the former becomes the case, it would need to be under drivers/mfd
> as Lee asked for that (or even required).

Right if we go with MFD (which IMHO would be the cleaner approach)
then the base driver registering the regmap + cells / child devices
would live under drivers/mfd, there reboot/shutdown driver under
drivers/power/reset/ , gpio under drivers/gpio and any new
functionalities in the correct places for those functionalities.

Regards,

Hans


