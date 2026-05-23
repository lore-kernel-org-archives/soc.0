Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D483347BA7
	for <soc@lists.linux.dev>; Sat, 23 May 2026 13:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779541911; cv=pass; b=Xolk9nDnR6Y+gqt8YGkarWfJ9qSGfao+WqleDW2h6EWQ+jYBVffSH1EOjaITX2XSPohOcWrpAmVuzNwGlKM0R3oTRIVCqLAM4WmcSQ0H4/tGc110vjxvI6a0bRMw7JFylevywAS9e+TEzb78EOplK+u4/cpAqvZafJenIl4iBUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779541911; c=relaxed/simple;
	bh=HwiLNnc61FnAI/t7d7ietZ5eVUORWchduxDDnW9nZmk=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cN5UW/5G3yIH7hmKNkHR7b0hlfvyVtmtt0/7D9Qej4rGMSl/fsIf292olKm3xh9rGDcoi4stxg995VIkMghoLowOV/c94SSRx0GNRNOwmJy5tMDQ+AZZcInee8NODDMWKrBtSmQbQvzmAWpmRVDk1eFf/2fK010kC14J5yGN8z4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lV+ZvM8Y; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lV+ZvM8Y"
Received: by smtp.kernel.org (Postfix)
	id 2816F1F00A3A; Sat, 23 May 2026 13:11:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1779541909;
	b=LdEMiC5wwu2EfC4AiDTXu0T8GAt4BdEyCSJS9C3VDyBWP/v1CtnqQFTMfXz6vFrZj6yK
	 RWTeiQc7GE7ns+NSE0wap5tgV9nonbyZ277IIHBVT/HLU7MHpXhP0tYym+YRd9kejvraz
	 ixFGKbOqLx7YR9W7Lr0vf8z72cMOOQ44r6KqajJ3pEaxt4iAjNARvwS/hRtGfNIpBxodO
	 F8eXCo7FN+/8j5SO/1adcPsdMDd0Wqskb9SVKlKQ72lDSe8T//j+UdtQs7pmFIE6EHQR3
	 b/t2jVNSzs+POID31Wzd83hJwYntoWHUNDEYaBo9r/Anl02BXCnO+TYPCuBsFSwRpyg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1779541909;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
	 Message-ID:MIME-Version:Content-Type;
	bh=4GF9NtWbf1dRdTsD95voqDyeD0yjVtY9SMvb/vzMbcE=;
	b=TDJlMrlF6azlYMY0MnSTZdnX8EzZarTZGivMt9E+TZ+kRjdimt9vZY67wcv/228hUfzP
	 sj/WD9vAWzPNRdsS4dTJvTPKhv+nP9y9XlqcGcHMQBhNTIo4ZFVSMW+Ji/8mIt6+GEOaB
	 SEMlnSk4cdb9TJzIyO5xAr3glea/y6ASWTD+aqdUZQtTCQ++9uKBorX3iyx5zi0ku4etd
	 i9cMRDtmLPDxmRrjP7LJ+yBjkPX4zH+ZDmjEgGrgQtDhAVojT86iCkFIi12AyPFnbZDbN
	 W+ob6X7RvwuDTgAXKHiO2bYJjvC8B8EOUNxp9SWuiQWpikgjVD4MESiD7nOY/Rg103Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lV+ZvM8Y;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8351F1F000E9
	for <soc@kernel.org>; Sat, 23 May 2026 13:11:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lV+ZvM8Y
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 8351F1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49041e84237so14638835e9.1
        for <soc@kernel.org>; Sat, 23 May 2026 06:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779541907; x=1780146707; darn=kernel.org;
        h=mime-version:message-id:date:subject:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4GF9NtWbf1dRdTsD95voqDyeD0yjVtY9SMvb/vzMbcE=;
        b=lV+ZvM8YlSJD01pm17VeLLVWonf0O1v77nNcO8aBm0huETOYsYiOjLuSac8UT+ye6k
         kdTuZtv+o7t0Yx+mNVM4fxPPTjad6/IbmiEWjkATIxf55aNaiRd8MSpvFNBC5OZdtIX7
         bd5DCHWbc0YEfaQSAO/mXNPbCfX2DkrxpzXENwKPj129RkTI2UoUHG4o25CAZDE8kC87
         FoEJ5QsSvztSJrD5X6nBiMOTak7dwC2xlM6HZBlUhWioE8o5VIA8/eCfqPr/gezVYHcm
         cygI1mzH5IhgZX6LgJmTH+lMYTKFC4q4jSr9QhmoxLn3D4oozqsLQlQtDxjqL7+0qq25
         PjAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779541907; x=1780146707;
        h=mime-version:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4GF9NtWbf1dRdTsD95voqDyeD0yjVtY9SMvb/vzMbcE=;
        b=Gp+HXTLhztUJz/BdpcNvaKUYiY5KWPKecMA0mCsHDIrtGJdg+YyLFo+IwKEZcdN6E9
         B7BemhQLvpDz6ogrldCtaQxnYWaUiZheHmgm/092SszgQG08TyFxxw3UxHYHuh1CPybA
         GVLu+dWvTZP4HsHZN07b4kMUGf4QEn0W2tRyybSrQxn/W+NIbrCh58zbmFXWMBm2LrIc
         7IzaBdVTbgrS+q67vHvBFwwSoo/imoU8CcgNtfeAOtNEVHa0KQY5Ive+jDXslMNc/EJh
         bOht6AyS1rqWTlQBuuhLmPz6XKng57bbOnh0pyb92nRwo6/53Q0w20LN+Jcn0dIh+C6T
         0hSA==
X-Gm-Message-State: AOJu0YyQxe57SaqG9zOn3ja3810Pe/dga25SnWOaKgVGYQTpT8rYWQM5
	YjcovPXZ8ex6/YUREEYToW4lyfWv/RuOKJ2CBDmu9xQkYLfYePrdtdJxLtDyQMh3
X-Gm-Gg: Acq92OElVGRHbBh1cmZvsxItb0K3/GXEnIt/+CTnm3RIY73p20w0jyfQU9vPlrPQz4n
	k/yBjocVU+Th/Rq1VyO6tCvQJoUbHmZQSzN6ywBDhFFOqoPbccQsgj171EN2cHLgWWMWfoxZGPI
	I8PddpKqifOB7HodHrc3ojBr0LV+fwxmhaFgJYTHepQcKHpEF6/ZTASxIatMgSEXW7qfE0T946U
	3L4MYP9ZlEbjhy3eUYG6NEQdy+hQhIvD0M3DvUZ4JSdfSwPuQnnF0F5v5FK73ymppM2prFqgpKm
	IpGe7zAz4OGLblK8B3HcsJEx6/yPke8cQdS6pMYNAWfaqAMnw0ftn6iMZWuhwB/gyA7tGcyn9hO
	Q2HafaAcUkFxxTrE9jLNCiq0EKU95t1iZAj6MH9XtAQmWVDrEnPM6cNa083oYMTctZK23tLHupY
	IXjr8gX21/CnJLMsALD4QBILjw5icL1VJkvf5nuOLbcRd/l67gZ6L8xA==
X-Received: by 2002:a05:600c:1497:b0:490:3cf0:8d81 with SMTP id 5b1f17b1804b1-490424ad286mr59219005e9.13.1779541906620;
        Sat, 23 May 2026 06:11:46 -0700 (PDT)
Received: from strix.localnet ([197.250.226.17])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49044f2bad3sm122739705e9.0.2026.05.23.06.11.44
        for <soc@kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 06:11:45 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: soc@kernel.org
Subject: [GIT PULL] ARM: zte: clean up zx297520v3 doc. warnings
Date: Sat, 23 May 2026 16:11:35 +0300
Message-ID: <1991560.tdWV9SEqCh@strix>
Precedence: bulk
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2299338.irdbgypaU6";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart2299338.irdbgypaU6
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: soc@kernel.org
Subject: [GIT PULL] ARM: zte: clean up zx297520v3 doc. warnings
Date: Sat, 23 May 2026 16:11:35 +0300
Message-ID: <1991560.tdWV9SEqCh@strix>
MIME-Version: 1.0

Hello Arnd,

I am forwarding a patch from Randy Dunlap fixing mistakes I made in my zx29 documentation. I think this should be the last of the zx29 patches for 7.2.

The pull request is based on the current head of your soc/arm branch.

Best regards,
Stefan

The following changes since commit b4e49a4a38fd737f927defb2e9a6562f9ee62f0a:

  Merge tag 'zx29-plat-for-7.2' of https://gitlab.com/stefandoesinger/zx297520-kernel into soc/arm (2026-05-20 22:05:46 +0200)

are available in the Git repository at:

  https://gitlab.com/stefandoesinger/zx297520-kernel.git tags/zx29-docfix-for-7.2

for you to fetch changes up to 05836235e5412310057ea14e41e24dbc45a429bd:

  ARM: zte: clean up zx297520v3 doc. warnings (2026-05-23 15:38:59 +0300)

----------------------------------------------------------------
ARM: zte: clean up zx297520v3 doc. warnings

This pull request contains fixes for building the zx29 SoC documentation
contributed by Randy Dunlap.

----------------------------------------------------------------
Randy Dunlap (1):
      ARM: zte: clean up zx297520v3 doc. warnings

 Documentation/arch/arm/zte/zx297520v3.rst | 119 +++++++++++++++++++++++++++++++++++++++----------------------------------------
 1 file changed, 59 insertions(+), 60 deletions(-)

--nextPart2299338.irdbgypaU6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmoRp4cbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiK7gP/274pmxMGa5V7jhyz7Uf
biZVOi0jCfbjJbXGTwa3YVMwqOPs0mscYNgSbfU6Qi71rDHU16j/8D9cZRoU6JL1
2Kvp5XYpuXHTii5blfRpNwaHfc9PN2yr+Gv248XNQxQqywx5BIJVwuDzbsp6F2tF
bslkIkSQwpUUrikvTBoaSmbDaB6PTFG1Jpyy4XkQm8OvIQrwer7tD9luwqmHwtJl
Nk4+u2oYZTs8fQN2T6zp5l31q7wyc5umbMb4iT3gB5NNd4M6LAo3CG8JlD+fBAG8
iY/9+RkqE7B7ytsvkU4B/COZ5xh2gXeOfEyW5wR91ews4P5X8sW3FIK1wk8Mi1xG
MUlEKf7+ykJakS4UdzMRl1wgbsj3QWik4xrdfejMfLakHTAFqHvQExFLsenJ06Z5
lnhLNyDNJLqaIolvELCBSKPsvmQ1pQ5SDoXtFPC7IFcDDbsTJwR//8a55rtUU1QT
cWZ979MHUEmKe6MJoKiC92quZGuo/QEnU7/ivcD2GQsU3AVqvVpjyhlTPj8VoG0S
Q6dwmPd1U009l2lP+OduxxzRILbMq+GjD0mu9XZ6KfcZY0TbeuNauxB9XS1pwPQW
/bBNJOmz3Zz7SYxn5Y/7rqKCpDR49hDiQOqkomKHGjMgx2IARdyK4BTy4BIpe+MW
j6dQl+vfF4QRP5uTRQ0fd5iW
=8gMx
-----END PGP SIGNATURE-----

--nextPart2299338.irdbgypaU6--



