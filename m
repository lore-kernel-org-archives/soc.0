Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C02831AAB8
	for <soc@lists.linux.dev>; Sun, 19 Apr 2026 08:30:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776587418; cv=none; b=FyvdS3K7QMeRyn0SZf3C+wUhu1IFc0RU5SI+R02E6ZX7PZTzMKReLu/DyR40LOhaPaqoCSFWJZyQ0y8JkRjCjiJLRcEJT0yOClLLgNyLv3HKtSB9kIyBansOKcO9e86bwaFeHML8O1KSHNYKqQ5Gf6uM7YJGsZYDBAPaAe1jEGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776587418; c=relaxed/simple;
	bh=qtKOfm/PzOwBHxZdRJEmVpIhLYPKyAT3yRn4rvKbC8I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sNKsdlMDjCwrkkGUZr88BGNiI79gYiZ5r3FYbMVnxo3uLxe6UaaFddgaVxJeW7erAllFjBZ8bGtB2C2lZFsB3RdOaIHtz3Js5rnSVWID1vOSHwI3Y+RKCfrcldGg8xljRiwD6Yg2LtEGVcNlfSMdxHw6io2rFMptJM+lCi63ick=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NRPfaM3h; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NRPfaM3h"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48374014a77so25378645e9.3
        for <soc@lists.linux.dev>; Sun, 19 Apr 2026 01:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776587416; x=1777192216; darn=lists.linux.dev;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=XwKzTLRiHs5eANohxZZBlyVS97g8sNagXG2LtuYayk8=;
        b=NRPfaM3hEpFHDzOoNHh4Lzy0s9v+ylbH0bhUzmnkG87ucwZ5JnDA64sFIQg5MULLiP
         0zBxf9ns5sDeX4r2jQGZMEbFDDNmKFdURJvh43vjjwf6qmL4hXTpyoQwlK3ujyN+lD5X
         R12G2vHXvC2RwelHnFDwvYQhGAGqj9pboEGp1ZV/NLjLPFFuu5q8L1MrAgHcGvElH5D4
         Wp3dN+kYqh+/VdXAtqMR2fkPG5Xp57H5rivhaApd17gp2CL3hBHQYcHNs1QXpSbuBQud
         hubXpL4RIWfSvWw5mRBb8+0q64qM7uJA5nvvKIi3aOCL5+K92n8CKDMRxNLByy0YltQf
         MIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776587416; x=1777192216;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XwKzTLRiHs5eANohxZZBlyVS97g8sNagXG2LtuYayk8=;
        b=UXgKeW3a5fqtM8OP+UgZ/4PYRoROgVkGuF4EsOLDgZ1P/W6sVZ0lsqjkQpirXyTmQ5
         7h/2gjEq5WRQqqToy/zQ11oY4pbaJIEO/NggoVm09ZkvOjxpKFxbgYdXD/3j8i6Dij2X
         Dteo3VgR9Wmdq8FsYVz69yD/XP1W+2upf0kjm5B/JAGQ85CgSRxMMBjLaa1oA6qz8kAy
         JkGfQUEJLcXDRq3rk8ZtXeJvCRNwTZAXPmACd3Jji/ehVn6uvdfeEJPxHEmj0kNjg+zp
         tDxwWaz2QEy5iFpH4cuwMXQRciJQ/Dn7cZVApbNNWKD+MWNwndWCPp2Dzn9qBTi1AtyZ
         piWw==
X-Forwarded-Encrypted: i=1; AFNElJ9Ps2MnHIc4j0J6VKtcVO+7QWJnWZHUmTca5MIp4E1sBbd2+dZh3Vz/rjpdKcckCum+iC0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4vkj9CbyuhArMOCwej2+fe1VSI+eairjOdzfsbTTP5ydAaTt5
	/Obs6LPjkkxxDpYAgyQsqO7fwhdhUWTjdoyjAu7yXMUbQsPyDM8vjKv7
X-Gm-Gg: AeBDieurSDBbHVNv1R5u3GeQoR143bjOHXdsTWowHcWvbRvgGIkdVIeaUVfUZZCTOS1
	c90AVnwyx7s9ODsEKwe3/3O/PEl2a8sxrpQkxNsgQz+whvwwcJuaA+xpeOs1M2bBRfRjx0cGRbl
	uB7/uwfmfLDFZQblgoWxwmR2OdzPspVH6Eadv691DUKzPHJe6yWIijUD8oH5A7WKLqah+PcWt+m
	j0vTwJNIYi/J/CR3Y+W0+Lrbvd56rrFxARHi7eq8M7ivqgszqZkJsCCoMER3sAo9E5Y3a0dJLB/
	r8ZO3WBaGBlqDBgMBSR3PkOCYs9ZrXMVQGRijrJD8sgEeiulkbYUKNAT4/GNWZjfhgp3iHVx6lZ
	I7DRD7fUn0oJvvILJQn9JqrQaxkPcXLmRP/zmQ1sR14w9W+P1mFs+jcZ6AMTg+QvUScuccpxU6D
	3Lr3o863NjScTxhuNIMqqciCL0dNoHxCBpWeKqaXephPqBzd/XwUS+H8M4nw==
X-Received: by 2002:a05:600c:a108:b0:488:a82f:bbb4 with SMTP id 5b1f17b1804b1-488fb78a0famr104158265e9.26.1776587415722;
        Sun, 19 Apr 2026 01:30:15 -0700 (PDT)
Received: from strix.localnet ([197.250.227.196])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc11ced7sm183002605e9.0.2026.04.19.01.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 01:30:14 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, Drew Fustini <fustini@kernel.org>,
 Linus Walleij <linusw@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 Russell King <linux@armlinux.org.uk>, soc@lists.linux.dev,
 Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-serial@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v4 2/8] dt-bindings: arm: Add zx297520v3 board binding
Date: Sun, 19 Apr 2026 11:30:04 +0300
Message-ID: <6264667.lOV4Wx5bFT@strix>
In-Reply-To: <177646012448.2165534.5760108355183774935.robh@kernel.org>
References:
 <20260416-send-v4-0-e19d02b944ec@gmail.com>
 <20260416-send-v4-2-e19d02b944ec@gmail.com>
 <177646012448.2165534.5760108355183774935.robh@kernel.org>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5099586.31r3eYUQgx";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart5099586.31r3eYUQgx
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Date: Sun, 19 Apr 2026 11:30:04 +0300
Message-ID: <6264667.lOV4Wx5bFT@strix>
MIME-Version: 1.0

Hi Rob,

Am Samstag, 18. April 2026, 00:08:44 Ostafrikanische Zeit schrieben Sie:

> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:

Here is a new PEBKAC issue for your mail template: I ran dt_binding_check, it 
wrote the warning you pointed out, but I only checked the return value - which 
indicated success. Which I guess makes sense for a warning, since there seem 
to be a few preexisting ones. The warning itself was somewhere in the 
scrollback because I let dt_binding_check check all the files.

So I learned I have to actually look at the output to see if there are any 
warnings.

Cheers,
Stefan

--nextPart5099586.31r3eYUQgx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmnkkowbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiU8AP/33cFyCxCEyOMxTZRv29
5Ypqo+NuvryxWrpo7I7s2VQvp5/q6NlSpNpmQXLcgkV9mGS6axv15mCZ6py1gJMc
HSIKkTqWZjzxeHoLZ2oZQCyFbMcPwvGhNK0qP/ckwWkv/4g/UFB9ujycOTFXVERG
RWQyIvROo7Lb9IN8ozKehzOvD7ga+AjD0i4RQLlaGS/TbHUcDZKWr6+WqJ8SicVV
wbiQU3cr4lAG7uCbKiAt2Jpcw1Aeuyfyci1hX4jL6KrY+MK6yG39ksq84DPUOgLI
xR+5Rxitj449eH0hPE20fkrE5UvivbYiCNzkrhyqWn42ahIj5DIBrSayWB0KUjff
lm6wYdL+yh/9760hh92rYCeNFYOz+kEQECsAHhTwqX73gCWFL5rYXJzFpNudFqXi
24Yx9+vZm7OhMi+lGJjM1Tn51ztC7MsP0ozz+PAMpuiEl6luLD3ybO3XO0eTEvhZ
oSylCbtelCVkO3KnW44cSdAspNidQ5Mr1EEXtLxUXOSSFQrmAGXmqmph3vSws7vi
X3G+z1WQ3VQkpUUfYyzV5AD1IORM+TfeZtFbKUrbr2Brk54ib7UxztFqfuizV2V4
9FuBUwZE1uXCLz3m7cB5yp+2zNX1AtkF/5STPQJh2hUC+mpbA68beyv6lefWIOKC
NohR6Eo79ZapFjltX76P8lbO
=NAGE
-----END PGP SIGNATURE-----

--nextPart5099586.31r3eYUQgx--



