Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5FA1EF0AA
	for <soc@lists.linux.dev>; Fri,  8 Nov 2024 13:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731072845; cv=none; b=h5kAGIAgWw45S2A4/KWvr7N0R1FxzxE//Op+M2VYYGdXVq24tUrP8sKDNqahSFNIhfYAp4vs/Csbuchnk+eEOljOaYikFqhWgFhm+n3nR6J3u2RfodrWwlgqZjMGGBz/XrT+duqF/f7BLyRNN8QwnwjkN+/4L1EdD01xXw3O9/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731072845; c=relaxed/simple;
	bh=5vpA3Mko9N7bNZwskXZr7hvY9tRZatGTnf174+DZG6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nXE1esiCyl+roARZ9jSckNiAYRKCRZBEp5VgkNw+GAs7byx1+ykw1F8k093ht5xAHw5oYDKZAb6I50QG2IootXKzLJ81xFfEKl3nzhpHjZDzqM5t6gaBWRVxuOqnLnBiXaXC8qdvrLA1RWz92Ahj4/UsAlq1CsXMd2r+5IGMgR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b=P41qRvLL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="P41qRvLL"
Received: by smtp.kernel.org (Postfix)
	id 5D9E2C4AF0C; Fri,  8 Nov 2024 13:34:05 +0000 (UTC)
Received: from mail.nic.cz (mail.nic.cz [217.31.204.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AF1BBC4CECD;
	Fri,  8 Nov 2024 13:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AF1BBC4CECD
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=nic.cz
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=nic.cz
Received: from solitude (unknown [172.20.6.88])
	by mail.nic.cz (Postfix) with ESMTPS id 7AD541C12A8;
	Fri,  8 Nov 2024 14:34:00 +0100 (CET)
Authentication-Results: mail.nic.cz;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
	t=1731072841; bh=5vpA3Mko9N7bNZwskXZr7hvY9tRZatGTnf174+DZG6A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From:Reply-To:
	 Subject:To:Cc;
	b=P41qRvLLqv6KnddUiZK7d9VfBkmbnrY+WCf52XecBz+LgaTUt28D+K4Bp+ESAmxWy
	 lXvfemJQPbHqgwcQL6V7ddBsqe31xOCcnuBzoqU/H5lr96wgraoWkjcarZ+7yzf5ah
	 hF/j6hT1sdXGoONjMC606Hm97aaL0O1wWveGbeMg=
Date: Fri, 8 Nov 2024 14:34:00 +0100
From: Marek =?utf-8?B?QmVow7pu?= <marek.behun@nic.cz>
To: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>, 
	linux-leds@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, arm@kernel.org, Andy Shevchenko <andy@kernel.org>, 
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH leds v6 12/12] ARM: dts: turris-omnia: Add global LED
 brightness change interrupt
Message-ID: <ksioz5fsdzt5gtszwlvxedtuqj3hehciv2gcpmbxof3ekczm3b@of2lhmsrmgb2>
References: <20241108132845.31005-1-kabel@kernel.org>
 <20241108132845.31005-13-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241108132845.31005-13-kabel@kernel.org>
X-Spamd-Result: default: False [-0.10 / 16.00];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	WHITELISTED_IP(0.00)[172.20.6.88];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Pre-Result: action=no action;
	module=multimap;
	Matched map: WHITELISTED_IP
X-Rspamd-Server: mail
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 7AD541C12A8

Forgot to drop this patch (Gregory already applied it on mvebu/dt).
Sorry.

Marek
