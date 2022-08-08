Return-Path: <SRS0=fqwV=YM=gmail.com=ray.taylor5533@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF885C00140
	for <soc@archiver.kernel.org>; Mon,  8 Aug 2022 18:14:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 95859C433D7; Mon,  8 Aug 2022 18:14:00 +0000 (UTC)
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com [209.85.221.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BB43EC433D6
	for <soc@kernel.org>; Mon,  8 Aug 2022 18:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org BB43EC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f66.google.com with SMTP id p10so11761737wru.8
        for <soc@kernel.org>; Mon, 08 Aug 2022 11:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:mime-version:subject:to:from:date:from:to:cc;
        bh=N7NQD4tMuh8xOVAcPfkQgKHyDBEcWCrH4VZeEixcaUA=;
        b=R6wOl6eR34bnK5c9/eOPUssvLpyfWeRcdLvbtSBqUuwljGgq47vS4OxCop4guwvUXk
         oaUkT6vn/CJ6HNkyXxJSVYDIOiB+IeWMEMmFtN/gRN7Os1bttVKvZClkOF2gb8gezKAG
         l4M2O0ZkcB5KBjsv6LPWtThUd2mtQqsMpWJFo1j3jxm+O+UbNLL6+82VuDKbGq4gA46r
         BbMLr4q+Q1z2ol+NQGpfgCiXHvK1nnqnd0EkuZ3epWn7qrenj7OjuKAPQYNKXBU8C0zs
         YEPyZL9ApARkPtABGUyu/dOCqDgOWQN/dKnJW//5fZsJskUTCMxTNdQEq9SvSvrtdAsO
         Yhug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:mime-version:subject:to:from:date:x-gm-message-state
         :from:to:cc;
        bh=N7NQD4tMuh8xOVAcPfkQgKHyDBEcWCrH4VZeEixcaUA=;
        b=zTf2BNHNi8fsFVOVqGdsPQCzpJJaMrLYmPsNnAVC6UG8evK3287u84Ye5oSRxni9iL
         vYT1iEevVlvAk6YHraMiJV0/FKP8wZ8GdtrFp5fshQFeWGDredjiGQ+241dCGaDCoeV9
         qHASJqgI0TgFSB1aBjhsU6m6c/NJbmJMv9jXFc8Yj9twWyWgIahTJ3uHINA3/HPTthDP
         1lIea73yOxjdfrMm+exeMq7MFKjRnyD/Z85fxl8bD9GZlF75u0nBB+0M/k9ed7gnomyl
         yTKn/a2Eyx90Ph7s9iOX+3Ld/MLYVCqy8HKY7QesAe0C44x3ok/KfGr0KgAIWNI52uMF
         zWxA==
X-Gm-Message-State: ACgBeo2ItWknFnl5uJ/5DwdjxMtfcDVWgI1o7Fu+hYj4qlCTWi6Kt5IE
	25QzdKc3VNbVBTWbDrTchUcMezcthCMoS0RD
X-Google-Smtp-Source: AA6agR7bmIzymTRDLe64ijbhIuId2lgD8kHtfFQIQX7Koqo9rVF52w5kjlFJG3PGHW6kwdxyzHvI/w==
X-Received: by 2002:a5d:47aa:0:b0:21e:e1aa:2542 with SMTP id 10-20020a5d47aa000000b0021ee1aa2542mr11924736wrb.19.1659982437819;
        Mon, 08 Aug 2022 11:13:57 -0700 (PDT)
Received: from user-PC ([103.209.253.16])
        by smtp.gmail.com with ESMTPSA id ck19-20020a5d5e93000000b0021ee65426a2sm11863665wrb.65.2022.08.08.11.13.55
        for <soc@kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Aug 2022 11:13:57 -0700 (PDT)
Date: Mon, 8 Aug 2022 22:02:29 +0400
From: =?UTF-8?B?2LPYp9mF2Yog2KfZhNi52KfZhdix2Yo=?= <ray.taylor5533@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc <soc@kernel.org>
Subject: Re: Reminder of my previous letter.
X-Priority: 3
X-GUID: 360E734A-6FCD-4BA7-99F5-121E3A18D98E
X-Has-Attach: no
X-Mailer: Foxmail 7.2.23.121[en]
Mime-Version: 1.0
Message-ID: <2022080821431245637436@gmail.com>
Content-Type: multipart/alternative;
	boundary="----=_001_NextPart413703443542_=----"

This is a multi-part message in MIME format.

------=_001_NextPart413703443542_=----
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

R29vZCBkYXkgbXkgRnJpZW5kLCBJIGhvcGUgeW91IHJlY2VpdmVkIG15IHByZXZpb3VzIGxldHRl
cj8gSSBiZWxpZXZlIHlvdeKAmXJlIHNtYXJ0IGFuZCBhIGJ1c2luZXNzIG15c3RlcmlvdXMgcGVy
c29uLiBJdCB3b3VsZCBiZSBhbiBob25vciBpZiB3ZSBjYW4gYmUgZnJpZW5kcy4gSSBhbSBBbC1B
bXJpLCBmcm9tIER1YmFpLiBQbGVhc2UgY2FuIHdlIGhhdmUgYSBidXNpbmVzcyBkaXNjdXNzaW9u
IHRoYXQgY2FuIGJlbmVmaXQgYm90aCBvZiB1cz8gSSB3aWxsIGV4cGxhaW4gdGhlIGRldGFpbHMg
dG8geW91ciB1bmRlcnN0YW5kaW5nLg0KDQo=

------=_001_NextPart413703443542_=----
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DUTF-8"><style>body { line-height: 1.5; }body { font-size: 14px; font-f=
amily: "Segoe UI"; color: rgb(0, 0, 0); line-height: 1.5; }body { font-siz=
e: 14px; font-family: "Segoe UI"; color: rgb(0, 0, 0); line-height: 1.5; }=
</style></head><body>=0A<div><span></span></div><div><span><div style=3D"m=
argin: 10px;"><div style=3D""><font face=3D"verdana"><span style=3D"font-s=
ize: 13.3333px;">Good day my Friend, I hope you received my previous lette=
r? I believe you=E2=80=99re smart and a business mysterious person. It wou=
ld be an honor if we can be friends. I am Al-Amri, from Dubai. Please can =
we have a business discussion that can benefit both of us? I will explain =
the details to your understanding.</span></font></div><div style=3D"font-f=
amily: verdana; font-size: 10pt;"><br></div></div></span></div>=0A</body><=
/html>
------=_001_NextPart413703443542_=------

