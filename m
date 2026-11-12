Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794496147;
	b=cl+qNS8F66DnK273/kBgspIOtv+IQltDCw6qvOOSw9ja87Mo5ZPppbWM26tyZ9sNuruc
	 63b9tr2yU0TE/AGZrjg0LHx60tlzRUVW15BrguZE4UF+L4ZlwaPuy2PpesC9YZ5JlUNsR
	 rESqYGmGXvDNIcvtB3o6z/TL3opm66krSmW8wMpHxP3MeK1w7w4OpPlb1JYUuohSi/7OP
	 UvHWbCWed0AE0Dq7AWcHnED4aq08ZAEygaIyPhtxzEngDARb/iGcR38TFIVTZ+l8ZCGzR
	 f51pKDL+OiPf4tVkkQHl7VRaZyjJpRxPGj011qks/zv5UFd3NI58cY4aFb/Ty2leXXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496147;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=sGr120yhIBdaSdARYe9jHupZpoylhh+YQmi4ICs4aNQ=;
	b=HTZedKphfY/d9Dik3lwqsP7K932H4zf2mAKWL6RHyD0UzcVMtQgy4miXBvJ/N2j6aegb
	 WQugKAM0XkRx20Z6cqnkrVqV4Ls1d1K31zeGuG+BxFzKtsKAsGf4o07prwFmc3M6YBRsf
	 7BFNXxh2uhJAqbsw9FqTdSoQm8YXtw/grdO8C6QCChGX/LpQJaIS1Mz18JE8azySK8+/S
	 FF48Y/ODJX+yCimFJaz0+TlfwyK5UlKkiylnC9avAQD+dy0ud4bePn3nGFv8falTZ2hII
	 lA3wXyOi4l0QEzqPyr1q1lNuAkOkH2pblPuIMbCwneurT8HOlbx3fdMVH/KfkhH/Riw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=HV54rgju;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=JdOJUseH;
	arc=none smtp.remote-ip=103.168.172.145
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E84D606A883
	for <soc@lists.linux.dev>; Thu, 12 Nov 2026 15:09:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E84D606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=HV54rgju;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=JdOJUseH
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 908E7EC0596
	for <soc@lists.linux.dev>; Thu, 12 Nov 2026 10:09:05 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Thu, 12 Nov 2026 10:09:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1794496141;
	 x=1794582541; bh=sGr120yhIBdaSdARYe9jHupZpoylhh+YQmi4ICs4aNQ=; b=
	HV54rgju8oopQ8mrCiZACFhXZUaGpUVUQftb8kZ80IVHjBGH6at1SQmdMkZU0pgn
	+yZ42wZ+Xaw9imltPwKrgmW3NRRbfyUGxS6fYyW8BtNTddNmCEehJypTF8Jkd52P
	jK/499UeBxEWUyqhuHEa0o7grlznny3JbJa0mnoaVqpR0gVInHb2bugzAbvV1H9V
	B3lmWHpO9idj5aVCreNDVUo+X/NQJvR7/4357aBx5ivMwMCHi2w+IeunQCIRlawQ
	rdXSVwFcJ1X1WV6c9/QbaFDrFm63i7jqDe2m5iw+F3GqxYB6CEo6yVYxpzvR1Qkz
	v/U+vixcFxqO8oPlhoF9RQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794496141; x=
	1794582541; bh=sGr120yhIBdaSdARYe9jHupZpoylhh+YQmi4ICs4aNQ=; b=J
	dOJUseH2roRfTOnk6kxsl/Kcy1QawGq7gsdKrpB5r4tTcQRk7sxqLrauE7SUvtBC
	1hq+16OI7WTEa9mirPeuROi6mUrvSRHr+PYo/duFLIz00Y2bnX30neOep6BBkKKD
	KC9tCylFVJP0KeAsonFesDkEoUNmGSD7Og0vlB691YocVqWKuU5NHU9EEYLDeyua
	dgPX1HFU/zUu3AA2pjKnoVXV+XT602HXumbSxxAYE0i+ADcGkxKJxUbbYYHbsTKx
	Q+OIhwT6GZxBrpvXX8dcY0jqO1cRafkAtNJ2OghfJiXnzw7yhyWZVvUlQMEPRoeR
	HraVzbgSehwG665Uxxtqw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794496141; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+; rt=PHNvY0BsaXN0cy5saW51eC5kZXY+;
	s=fm2:rsa-sha256:bhv4dj3Vy0T40klT659PvbZfut2Qp/xqVpd5S9mQJImYtF+
	VgddDVvUUeChqs5wREIX0a/KFX+L9GtG0O/L1Yrcyl09xZWdLLYcJ7aqE8BuwpwG
	4QHz5QQAVQUyoAtZLuRTJzwstycCaLxfsOARblVUlyRy+Jh+cT9wd93f8GnW5Vpx
	o5yl7OyGJd35Lb4XsVqayqresFD6ZegSQ0PPdGbvy/P13bShsJSct+AfYU0ItHqG
	C7kV3+3e4lvaOVfXe4eIsAwnsxUTHVf2hzppbbq6LALTAdFQiFoEZM3BtQPCfsAV
	565g+XYKoSI4K35X8zW8kvgXFJegRp/QthWaryw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:wxbtSMbEorYH0lZI3pdea9/rpvvHzsSRIfi3r/1IPFE=:GBzSCyfBPfq54wbrZD9CYEBaiyqPb2ywhRWDhbfcUoo=;
X-ME-Sender: <xms:idb1an9vAppKmkZIo5c3WS4RP5FQUSjk5B8C1MS_i4hIugqDCLen6Q>
    <xme:idb1auhm2IlCizSgHGDn4KduduQi9xANONo4t_EhrvRsWU8giXmawSSI8lZpvFPGf
    iZ2s4YVuYTVJt831WtSk4JiBdDH78Cqltq0gGaniyhJnuzBueaGHzg2>
X-ME-Proxy-Cause: dmFkZTE7YpGM5r+CZhs7LsKN1SVk++5MSLG27RSXn6MgJjGV3wg+pkV04g1c/VOwRMjCiI
    Bg+oxUOLNImdpVOXDw6KQOuqD9lwjXzsoiE7i5KRtKeDwglSDqNuEyG7H2wBLB1GrlBKa+
    8OUaTSrFJSb1rr8NIpUE0Myf85czDQ04ldSU4IfA6LSGll4/sa/OOdbcxbBmCujjcNGoO3
    8ZBWeq05m2ejO4Kt/tH3DgDXNdutu8JBlzJWfI9c3KOOYkM+7fwvm+saKsII+M9Fn8Ylhb
    3mRYSMa521FXMQicJ9KoFIfuzFT3GeY4e0h7je/rfhx2oJCLwbVI7+9GFqNesO1hEuthUE
    C6WDVh5IpQnNnxqZWAn9CtJmVjMQ7x8OVFMmeenEHaemxE/CY5MpoUby795fMvRsAZoLrC
    rn7oMc7JE8OtuPTBjquyKicRWueITPz4hFFJCFr3cInAMp2ozwHG87AHAz2Ikc/UVGUOzd
    wd2x2Qent+9TjVCOQHAgWobugpkg52KVLvDeYTajwO4RLNt4xhz4v22gDIHkei425lfg4l
    wVadgEwixDdYsqbyC81rolVPZuRbtacJUJ3ofhNmPW8Qgg6K14w9j1GKW9Jjrhrys7OU77
    e1Vo0ujUJealjTDj8vOj9b4z5zcILaM7UOm0iTmYghh9Q1mpE3Y6uizLqBdQ
X-ME-Proxy: <xmx:i9b1ajgmY3ALz2X6FE7Krrs80qHaE0sCg6y8-Yp3v9mZI2TDPLstmQ>
    <xmx:i9b1agcJ2O06osTU8eKOQS6e3OY-ajguoyN_EGNnwR2CZzZ9H8MjYQ>
    <xmx:i9b1ai2SbyIhE1_fX2_2RSliHLUSB7fuEp2wVWowftEUO10SXoKRNQ>
    <xmx:i9b1asp64wSKhIKMaHHD8yBJitxl6_5WqV9SOrsdt60r8ug8aVg5yA>
    <xmx:jdb1ajxcaAc11ne6H5QATMQosJXds2NP5hLNByN8M2Vy0YdVtOVxZdF2>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 8563C32A009C; Thu, 12 Nov 2026 10:08:57 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AXRzvbN5yUxV
Date: Thu, 12 Nov 2026 16:08:36 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: "Christian Brauner" <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org, kernel-dev@igalia.com,
 "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 linux-alpha@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org
Message-Id: <301115f6-3f1e-4e83-bc01-0ba49dec496a@app.fastmail.com>
In-Reply-To: <e3910a18-dc28-470f-be2f-6a6d568ba7e3@igalia.com>
References: <20261105-tonyk-syscall_table-v9-0-8d1275885d9c@igalia.com>
 <20261105-tonyk-syscall_table-v9-9-8d1275885d9c@igalia.com>
 <0cfb4dbf-f3e2-4ceb-ab89-0453ae59793d@app.fastmail.com>
 <e3910a18-dc28-470f-be2f-6a6d568ba7e3@igalia.com>
Subject: Re: [PATCH v9 09/15] syscalls: Add an option for offsetting the common table
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026, at 15:37, Andr=C3=A9 Almeida wrote:
> Em 12/11/2026 11:07, Arnd Bergmann escreveu:
>> On Thu, Nov 5, 2026, at 21:05, Andr=C3=A9 Almeida wrote:
> So one option does a string concat, the other option really does a sum=20
> operation. If I had used --offset 110, the result would be
>
> #define __NR_file_setattr (110 + 469)
> #define __NR_listns (110 + 470)
> #define __NR_rseq_slice_yield (110 + 471)

I think for consistency, that would have been fine here, possibly
using another macro.

      Arnd
