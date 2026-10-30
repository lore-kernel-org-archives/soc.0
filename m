Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793396188;
	b=bTUdnqgNJ86NgLFoaRmCFlajKSRAicFTdDb+g/vETBjYXr0oGPJPIokQaq1QgbCkQCo2
	 y02c6Opbia2VMrpJU4fgQQXeWrcyXSPY81Byj3X3OCFbwu9LYXyjGnir8v9G+jFT46/go
	 cUt8lWJxtUkmTJCtpTHVN8ixeFl2+/o/d8T2fv1Vi+WhzEEur5aN52he4la09ZmIQa30s
	 1Z3wLqxyyhidAaFqNEPfKTNwkhabY/NfuLCfqPxrpdGMbwvsEVyh1Cr8iq0MqJFbERIdE
	 eW4MKKfVQtwL038eSqUFHNgH+4FdEQgyP4/7x1yTpj37sPvkK07bVDig7PPzlgUc77w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793396188;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=oE0Ccbr5yPAfVWX0+h/q9Kt+558GBYavtTp5xHQ+Vuk=;
	b=eEG0SlHmbOiHytGdl2fRCxy2NIl3UMuszPn4oFqV3kyvF6JNypvirvADdck4RRpOkodX
	 qV6A1pJuwcn9ILGQ/zLZ0A4Cm8Oim+bDXIY2INTeW26X+ugo4C8PvyY4y80MHLHAEcKXK
	 CJyIAeQJs/0nXo+hN8PcFreu8WePRrCRR8Q6dhIijrxLUhw1I0qu8E4ZFiY4Rh8kM3h6T
	 AOrvA3Da/I2qJxUX0anyiFQoA+ckIKiLqApPfIavq7Pyng7wUph299mdBvqb8NCfKyM/n
	 /InEE/mXAVNA3S1+SC+z+oT8/BD53r6JZwciSK7+FurfDAYqVy/FaDz5NbOxJeALcow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=QmnpfjVN;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=I4s6ucNT;
	arc=none smtp.remote-ip=103.168.172.146
Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E997606A31A
	for <soc@lists.linux.dev>; Fri, 30 Oct 2026 21:36:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E997606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=QmnpfjVN;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=I4s6ucNT
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfout.phl.internal (Postfix) with ESMTP id 4DE99EC01EB
	for <soc@lists.linux.dev>; Fri, 30 Oct 2026 17:36:27 -0400 (EDT)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Fri, 30 Oct 2026 17:36:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793396184;
	 x=1793482584; bh=oE0Ccbr5yPAfVWX0+h/q9Kt+558GBYavtTp5xHQ+Vuk=; b=
	QmnpfjVNb5PXtxkjQ3UfhXQ4o0SvEsjyn7V0+caN/qbtfHRXESD5RTKYvbzZsMBo
	N6QilYQT74A7Hx7q31WKAYj/3K9dBmZzizD2a+qYzCdWLU0/Adthf7gC5X86mdKv
	JGZ3v8nlD1n3XQVzoPy0I0J1p8WpXUxH5FeXHflbczfM2ISqm1vPlQmmGp0FoooJ
	vrbgFD1EgFMx/cnmYgG4crMhUyxdGaGUHR7GGepJ41yA6BWbbkXqudqWqfXcAsM2
	+wCycCwu/0/KB7VvcMy1p+y4D4VyYj+TWy5zzGdmdknRH2jgJmOacFNcoJQxh0S5
	xg/C4i0snQ8pdLkPK767Rg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793396184; x=
	1793482584; bh=oE0Ccbr5yPAfVWX0+h/q9Kt+558GBYavtTp5xHQ+Vuk=; b=I
	4s6ucNT0OpQGltlw/h/IkCTcLN6YqujL7bLXr8rGedbS420TBCOfhKYc24uEaN5i
	f0dyJj2Gn4XWMW4diuZS+PhRHWIMgZRLDXnrrDTiFyqGsR/td41nTxy9FPm65lxw
	q25fRkA6u/AFLgfd74l+O/VpbAKWWpMfXDVT9mpxWbeFu85Vdbdh2scH2DcPk6FX
	RuGPSzo2UySDGJlUWWcvHUFgu4Siq+V0xy7T3PwSwslXDXWSfjoAfP/+EEJ5trYC
	Zuda8n37Rh2gPq83ueOceo69C5cUZkriWFHQhlZKoy0TpN3Bsb5pKA+Y6kvPiG+e
	ippXTr6hH6U/iyzA4djsg==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793396184; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+; rt=PHNvY0BsaXN0cy5saW51eC5kZXY+;
	s=fm2:rsa-sha256:N60fzPLgvO7iB5mzvsef6Bhgl7FqZm5cvzuhOQzH0g/r7w7
	jrZatOqmtsXPeAJhu+c3Xa6Zd3IUcJSurDa0YsgCMJdL5Yf700HHmbkx/mMbpuJ1
	jPjKKF2FFFxC8p2IiDmKIV6ilxCdGLitGaT7fnIqZt3SsCBQi9vMMgmbuhaQkh4Y
	e7bDUkMKUn9z6lEeTNnsA7ewtKI/oOoOYxCacJaO9Z3Nq3bS29bTLdjP5bqRFGVZ
	ppSWckB1sVb4Ald5ap4wMZzb+peqAOw53EyLFIFOIQQ084jSVY33V7e4oeflyQnW
	TSN2mCq0gi0BjLukJXvV+UlVxMVXwayc2LqaUpw==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:YjdUR5jCf6CjMO0+1WbAwxi6QqFcALkLZWjqCdv+dcU=:pBZXxo+rCnq0x6xDr1cY3qhidvDU5DP2DXZEtcqtZs8=;
X-ME-Sender: <xms:1Q3laipJfgN2WInhuzFVKtohAghkocsfPS7uiLCraWZ8ji4gZVEP5g>
    <xme:1Q3lare2x6zOCX8YOFF0ic5K_dgi10zFWYFVccZ69DNIo3yhDHjScWZwCjdVajqHW
    klc0khOIEIRDDNaxjmVxc9cKB1pa9EqMDj0bzTvAqyT25QiJxlzl8wA3Q>
X-ME-Proxy-Cause: dmFkZTGUd5/iMN2OMhfaJ26juaq7IE2rBPXg7DztrvCvjbx5YO48EAz/0qrk50laxyF6V4
    BpHj+L/0zigYN+dd2FqR85zk+puHQvwqHZwCrCjIJS5scqSsPNYZbmnAz3pZ9gQnNJgqz4
    qR+dkgsbrsYNJ1kCDdM3cDQirs82a7YUELotdxvyARVaYGqegdjrqXZTIlBItc3gUah1+I
    LoZoIEpjze+CkB57ofs85o25dD1AH6lY9KF6MRoq4GQqy1NQ/mnMrlOb8tgeuuXDShbXw/
    ALk65+CCens+NJLxICTHolv0gf74lmQMLkWgISvAgUotRrvsqezLCq3zuaYfhLj8kiPMBb
    Hq8hK1ZcR7+WQUGkK1xNKhCjAMrE6fNTe7aqJ0Wl3Uu7maczhAywzeIyxF1bPFmHgANBct
    dQNrN6SWqEaPS1S4zRyuNcBlbblte16I6+y0AC9Q2/QdBXRPzuxUcJfShI0X92EAI/1j/A
    RxOOzZmgBUCgmgA4j97KN7hcRSaQPPvLy0enI1P+fOrxD8bbbNxu/Yf7KSBNoB5zpI47tH
    AprzbWLkx1NhrGdnrbj07ksxdHavsR6zyeMYD49BNIA0kPfbTYmzJzRaf+eL6HfyXSE2lR
    zvc5jfe/iOrOHilz+6Np8tMaOpMUP1+Fp7W3a8EdNpJBl6jJWordvuKNdYuw
X-ME-Proxy: <xmx:1g3lapZIrhjgDU9w0EFAes4_xwS2wYEqX6aRYLBJqrmegBKSW4j8rg>
    <xmx:1g3lai-MZ0iZvFndWav1FxS6a8XRtOW7u7EDRGLbxEBkPlTAmbQ0xg>
    <xmx:1g3lavm-emB2RSY8iJlop2Du48NG9roLQHmuyKNYqYnNUlqpKAjIsg>
    <xmx:1g3lany772SX77tf-3-5KM0RnnPSe7i7teX5KFzMmdcx-_dLb_A7mQ>
    <xmx:2A3lamG4l-BrpFSVsyCzMMkofxQoTQviPK25Ox2SCMtIjYmSaY7acsnn>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 4ED5232A0097; Fri, 30 Oct 2026 17:36:21 -0400 (EDT)
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
X-ThreadId: Ar2juRASE0hJ
Date: Fri, 30 Oct 2026 22:36:01 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Huth" <thuth@redhat.com>, "Andy Lutomirski" <luto@kernel.org>,
 "Thomas Gleixner" <tglx@kernel.org>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>
Cc: soc@lists.linux.dev, shuah <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Message-Id: <256fea10-f0c9-411d-a6b6-a82cad357b57@app.fastmail.com>
In-Reply-To: <20261030174323.370687-1-thuth@redhat.com>
References: <20261030174323.370687-1-thuth@redhat.com>
Subject: Re: [PATCH] selftests: vDSO: Fix header search list for vgetrandom-chacha.S
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Oct 30, 2026, at 18:43, Thomas Huth wrote:
> On aarch64, vgetrandom-chacha.S includes the assembler file from
> arch/arm64/kernel/vdso/vgetrandom-chacha.S, and that includes
> <asm/assembler.h> which in turn includes lots of system header files.
> For this, we should make sure that the kernel headers of the
> *current* kernel are in the search path of the compiler, otherwise
> we end up including headers from /usr/include of the current distro
> instead, and this is calling for trouble! Thus use $(KHDR_INCLUDES)
> here to make sure that we are using the right header files.
> (This issue has been found in a patch series that replaces __ASSEMBLY__
> with __ASSEMBLER__ in the various kernel headers and finally stops
> defining __ASSEMBLY__ in the kernel makefiles - when vgetrandom-chacha.S
> now tries to include a header from /usr/include the compilation fails
> since those headers still require __ASSEMBLY__ to fence away the C code)
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  See this link for the build failure:
>  
> https://lore.kernel.org/oe-kbuild-all/9e294bfd-4704-42a5-a704-f301f4afe042@app.fastmail.com/

Tested-by: Arnd Bergmann <arnd@arndb.de> # (build tested)

If you like, I can add this to the asm-generic tree to avoid the
regression from your series, or Shuah can pick this up the normal
way as a bugfix for kselftest.

      Arnd
