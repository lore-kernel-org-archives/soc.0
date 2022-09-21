Return-Path: <SRS0=oDTW=ZY=gmail.com=charlemicha@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDE8C32771
	for <soc@archiver.kernel.org>; Wed, 21 Sep 2022 12:45:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id B9370C433D7; Wed, 21 Sep 2022 12:45:35 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D8CBCC433D6
	for <soc@kernel.org>; Wed, 21 Sep 2022 12:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D8CBCC433D6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f195.google.com with SMTP id ay9so3984711qtb.0
        for <soc@kernel.org>; Wed, 21 Sep 2022 05:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:mime-version:subject:to:from:date:from:to:cc:subject
         :date;
        bh=eeRPAFzFmq9vw1mXEz1qOjfR09bXxf65cqlpuoadNI4=;
        b=EJqcfrRyYIjdWLLhWsLZ/Q0nMbXvUx2JEo/9PcvvKueisZFf9VQhPsT+jKUeqbtGou
         3qO4ITFcyh78f9na8821BD05X/0v9qh9dao/tgdBPchjaCftqYbNh4hSJ6+sXmyOyImR
         PMxd64e+gMgGWX2OTu/3es6lBCJaPhXbmuOsegJtxoYY0LZXDYJscKR9tuziQ5bd9JDK
         kKTkfNMxT0gFDBQ+t1WTEbSVK35vcGd3FsqBjZE7mogy7xgNTiC9b5qPHYhuZFhwKdDE
         QAxajPhBX/urnV9sEK1YhlVTJw6NiAXAigHp0Ur9kTBHF+gEVv7c0zHIRAr2bOQYBO3J
         nBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:mime-version:subject:to:from:date:x-gm-message-state
         :from:to:cc:subject:date;
        bh=eeRPAFzFmq9vw1mXEz1qOjfR09bXxf65cqlpuoadNI4=;
        b=2+kjaiqWxQzl/LGweBrzixpWur+y3elSZJxFKrcl4xzooeqGBbem+oXwxJmxLTL2Ku
         KDw2YUe5g5BDD1TcnBNKkaNRgSR0ygwPQLckyu0P39s29J7AIHp0UjHkWYJFCpA4IkTB
         2M6zuX9v+kib8GB0iw7OC9ah6J9vm9Tojq9ZdBgZal9G2uQqlDdTqf26PJ3xJfYe0jrB
         s8v39NF+fjymlqkDsYBu3IKqLtgHRTo22eYx+E74eeKtsQ7ww4flalWsC0JNzA2dylWY
         pF5EW+EU6rGulKlr9ZSyzhllZH3oN9J7DnKNDQt3dUQiDxXHv/RIehazFJh6x32hclK4
         LDPg==
X-Gm-Message-State: ACrzQf2+zGGyRD6tpy6LQF6bWFA0L9JPGGHQPx5/DAgV3bbEn72nky75
	0fRdkMLW7ZVsW4+Ch0TV+mDMat0kyigmqw==
X-Google-Smtp-Source: AMsMyM4Gt2oDZ8xoSsvIwyOcpGEEzg26JfgsZxkght4I62lZBQtsm5jjmQg/WmTV3WoyMIfKfHZe/w==
X-Received: by 2002:ac8:5cc7:0:b0:35b:a759:f96d with SMTP id s7-20020ac85cc7000000b0035ba759f96dmr23223743qta.658.1663764333671;
        Wed, 21 Sep 2022 05:45:33 -0700 (PDT)
Received: from user-PC ([172.98.92.95])
        by smtp.gmail.com with ESMTPSA id de4-20020a05620a370400b006bbb07ebd83sm1806445qkb.108.2022.09.21.05.45.31
        for <soc@kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Sep 2022 05:45:33 -0700 (PDT)
Date: Wed, 21 Sep 2022 16:44:08 +0400
From: =?UTF-8?B?2LPYp9mF2Yog2KfZhNi52KfZhdix2Yo=?= <charlemicha@gmail.com>
List-Id: <soc.lore.kernel.org>
To: soc <soc@kernel.org>
Subject: Re: Reminder of my previous letter
X-Priority: 3
X-GUID: C30A0D4E-AAF7-4EA3-B19E-360ED0A98BEE
X-Has-Attach: no
X-Mailer: Foxmail 7.2.23.121[en]
Mime-Version: 1.0
Message-ID: <20220921163458200395129@gmail.com>
Content-Type: multipart/alternative;
	boundary="----=_001_NextPart123324718170_=----"

This is a multi-part message in MIME format.

------=_001_NextPart123324718170_=----
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

R29vZCBkYXkgbXkgRnJpZW5kLCBJIGhvcGUgeW91IHJlY2VpdmVkIG15IHByZXZpb3VzIGxldHRl
cj8gSSBiZWxpZXZlIHlvdeKAmXJlIHNtYXJ0IGFuZCBhIGJ1c2luZXNzIG15c3RlcmlvdXMgcGVy
c29uLiBJdCB3b3VsZCBiZSBhbiBob25vciBpZiB3ZSBjYW4gYmUgZnJpZW5kcy4gSSBhbSBBbC1B
bXJpLCBmcm9tIER1YmFpLiBQbGVhc2UgY2FuIHdlIGhhdmUgYSBidXNpbmVzcyBkaXNjdXNzaW9u
IHRoYXQgY2FuIGJlbmVmaXQgYm90aCBvZiB1cz8gSSB3aWxsIGV4cGxhaW4gdGhlIGRldGFpbHMg
dG8geW91ciB1bmRlcnN0YW5kaW5nLg0KDQo=

------=_001_NextPart123324718170_=----
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charse=
t=3DUTF-8"><style>body { line-height: 1.5; }body { font-size: 14px; font-f=
amily: "Segoe UI"; color: rgb(0, 0, 0); line-height: 1.5; }body { font-siz=
e: 14px; font-family: "Segoe UI"; color: rgb(0, 0, 0); line-height: 1.5; }=
</style></head><body>=0A<div><span></span></div><div><span><div style=3D"m=
argin: 10px;"><div style=3D""><font face=3D"verdana" style=3D"font-size: 1=
5px;">Good day my Friend, I hope you received my previous letter? I believ=
e you=E2=80=99re smart and a business mysterious person. It would be an ho=
nor if we can be friends. I am Al-Amri, from Dubai. Please can we have a b=
usiness discussion that can benefit both of us? I will explain the details=
 to your understanding.</font></div><div style=3D"font-family: verdana; fo=
nt-size: 10pt;"><br></div></div></span></div>=0A</body></html>
------=_001_NextPart123324718170_=------

