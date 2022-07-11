Return-Path: <SRS0=fuia=XQ=gmail.com=brinas.valwane@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F25C43334
	for <soc@archiver.kernel.org>; Mon, 11 Jul 2022 19:17:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 4F5C4C34115; Mon, 11 Jul 2022 19:17:40 +0000 (UTC)
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id A91F1C341C8
	for <soc@kernel.org>; Mon, 11 Jul 2022 19:17:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org A91F1C341C8
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f193.google.com with SMTP id o12so5564805pfp.5
        for <soc@kernel.org>; Mon, 11 Jul 2022 12:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:mime-version:message-id;
        bh=d6arflfJlHTFN3X3ti2mA1M1b4XCuUkF3rMDcUavfbQ=;
        b=pmK35XHl6kQPCsxlNS/NGoMeEVUiMg/VG8hHUVGo9uQGQS302vGrMON0W5FUPamGSd
         Gwm1Kl+MD1iShY13eTZBhxQeKsKD2hD1DHehbRE+qyGUNfOG3A7A9lFFvl+lu94Nlg39
         RzVefSWrkdXB/A6YNEosp3ailsvKH4UsUmMm1yRqWrYVkGnM5cQblT+v0hWbiVX5ggVu
         5GBVsHs2Vuepk+P1XnR/CMpBJu72pcT4TrKqk7Ia9noj4gLNN2o6RFpVDy/NWo70v/hx
         OesIKueBCVGM4vUlFhZxGP8KzEmhjCHPX2pk4/K2W7iSXr6Q0CWdim1Df2QCmwwfwPXs
         wW7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:mime-version:message-id;
        bh=d6arflfJlHTFN3X3ti2mA1M1b4XCuUkF3rMDcUavfbQ=;
        b=zpH1tcb04iKgJJk/t2R2mnWRf3iHLyAJwI7M8m1MIexhrcDLwzuXop8NJlCPp7inmL
         xrX0E+NmLLi3RBf4m/UV3vzbhf3HDpgtNEZar7Fg1xHDkxeyqKHR+LBZgh40D0sxR1zM
         EJ3Alx+QeRhu/jK3MP8wF3PP143s9fltLy69oUy2scVyKNyaK9yAnH4Tm8Dfga52u7WA
         YsPnXSIaXElLdacmIYEoEHLAZzvh6nVXjtPu10yyS+lBTs+5haQZPcNgCgYU2/bDq0xa
         QjxLyvMjgUjgl/MTmKe1OvkNsArYP0jLnG2YFHJ4Qq8ES6QTl9YA9FBZ6Rjhsn8XdJED
         djdA==
X-Gm-Message-State: AJIora937Z+zs+e5oZU9DA7/9w8ej6Sjrg/1egitt/Qj5GoMLbo6FDr9
	NqsyZ3L2BaX+7G/ndojyzyjLoQ3VIdutZ4SC
X-Google-Smtp-Source: AGRyM1tZ2b2sQsPmW5D2JePz3mXw5N2XnRV8JjFG8oE9Zjecv71O3pI2V0uvQEpYuo6P56yawl0syg==
X-Received: by 2002:a63:e44b:0:b0:40d:9516:a8de with SMTP id i11-20020a63e44b000000b0040d9516a8demr17421591pgk.538.1657567058955;
        Mon, 11 Jul 2022 12:17:38 -0700 (PDT)
Received: from user-PC ([173.245.219.77])
        by smtp.gmail.com with ESMTPSA id b1-20020a170902bd4100b0016be834d544sm5004957plx.237.2022.07.11.12.17.36
        for <soc@kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Jul 2022 12:17:38 -0700 (PDT)
Date: Mon, 11 Jul 2022 22:58:36 +0400
From: =?utf-8?B?2LPYp9mF2Yog2KfZhNi52KfZhdix2Yo=?= <brinas.valwane@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc <soc@kernel.org>
Subject: Kindly get back to me immediately.
X-Priority: 3
X-GUID: F508485A-DFE3-46C6-8F30-03CAB52D7AB5
X-Has-Attach: no
X-Mailer: Foxmail 7.2.23.119[en]
Mime-Version: 1.0
Message-ID: <2022071122583278093623@gmail.com>
Content-Type: multipart/alternative;
	boundary="----=_001_NextPart370743774388_=----"

This is a multi-part message in MIME format.

------=_001_NextPart370743774388_=----
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64

R29vZCBkYXkgbXkgRnJpZW5kLCBJIGhvcGUgeW91IHJlY2VpdmVkIG15IHByZXZpb3VzIGxldHRl
cj8gSSBiZWxpZXZlIHlvdeKAmXJlIHNtYXJ0IGFuZCBhIGJ1c2luZXNzIG15c3RlcmlvdXMgcGVy
c29uLiBJdCB3b3VsZCBiZSBhbiBob25vciBpZiB3ZSBjYW4gYmUgZnJpZW5kcy4gSSBhbSBBbC1B
bXJpLCBmcm9tIER1YmFpLiBQbGVhc2UgY2FuIHdlIGhhdmUgYSBidXNpbmVzcyBkaXNjdXNzaW9u
IHRoYXQgY2FuIGJlbmVmaXQgYm90aCBvZiB1cz8gSSB3aWxsIGV4cGxhaW4gdGhlIGRldGFpbHMg
dG8geW91ciB1bmRlcnN0YW5kaW5nLg0K

------=_001_NextPart370743774388_=----
Content-Type: text/html;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3Dutf-8"><style>body { line-height: 1.5; }body { font-size: 14px; font-f=
amily: "Segoe UI"; color: rgb(0, 0, 0); line-height: 1.5; }</style></head>=
<body>=0A<div><span></span></div><div><span><div style=3D"margin: 10px;"><=
div style=3D""><font face=3D"verdana"><span style=3D"font-size: 13.3333px;=
">Good day my Friend, I hope you received my previous letter? I believe yo=
u=E2=80=99re smart and a business mysterious person. It would be an honor =
if we can be friends. I am Al-Amri, from Dubai. Please can we have a busin=
ess discussion that can benefit both of us? I will explain the details to =
your understanding.</span></font></div></div></span></div>=0A</body></html=
>
------=_001_NextPart370743774388_=------

