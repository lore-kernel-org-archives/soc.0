Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793606831;
	b=3OciJe1yqkNDNrmbbmzLUS6jBbY3G4K+D+wS9GHfwkI1H3NFmDN6oqnfrnV3u5fChoyu
	 QPFwPLT59DO76DEL0QBEegmSob6+3pFIskEI5fd4ive/qIRYrkmQpMXOJ2/C3DUS5t6eS
	 tXGfptdu2j6NB6JfvvK9xqZHJdymZdoILLHX549C9uFM7ysrWewU29rcCNoKbGYMZamdq
	 JaZOt/A3y+iizuzEDC2Mu2Jjk82fk+MSotpXsQGyJy27TnaYhp0I8lQhmgYC2Pd238jLh
	 wCf8e4cI4itAjtdvFfHOZc/wyNQZN/PchvRKrIf25xlwL4CTpkkEza83gGENmADTtRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793606831;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:Autocrypt:
	 In-Reply-To:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Language:Content-Type:
	 Content-Transfer-Encoding;
	bh=txDZNnldTMQQD+iUaNISkBDV+/o31r6YdqxFAbl/nU8=;
	b=f4ckCSSPV6TSIN3rrPQYYxCxo7nPz3MEJurvXHmGQDsOpnv6nsqZdXUnIu/pyO0sMh+8
	 2PzfbG7DE+e1BpBAracnfG8Zv30VHx2FaxZq4fZue2jzhGcMJaQEYOKkJmE6K8ZurP8g5
	 m0phC8SMAYozCi/Kpdltu2jDcFNqpWBOr+nu/GzPDS7LKroZ7tQSFaVAz2EA9M+PAHLRA
	 VXpx9ePYGGFKTgbvdQ3v+dEDx6XGR3m8sUzOfHy4N/GRAUUPoysNCmeGUijCzA23LF8TR
	 yHZ+9s/vPcQw6zXTMyvtj3hVPzpBWbOgZ5NWCT3Tru8tGV+KiLBs/MF8UlHR/ZjZIcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="fOg2t2e/";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5919A606A334
	for <soc@lists.linux.dev>; Mon,  2 Nov 2026 08:07:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5919A606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fOg2t2e/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793606829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=txDZNnldTMQQD+iUaNISkBDV+/o31r6YdqxFAbl/nU8=;
	b=fOg2t2e/egyKAfmdfdoWA9BFdB9QIe7NnNQ8GG//DE8PDrKFcTl+aGBL4LtMQKfFag6MNk
	5gWAKZp0oHFlVS5WU11sjYWdK7jiv68SebVOgzeDg7QbbEF33y9YnZbh+QcMKrwBjG/jdo
	C0pRPNi5CSLTJSG2VkVY/Y1wVjzco+U=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-rm86ach7PviVjHHSIhBOhA-1; Mon, 02 Nov 2026 03:07:08 -0500
X-MC-Unique: rm86ach7PviVjHHSIhBOhA-1
X-Mimecast-MFC-AGG-ID: rm86ach7PviVjHHSIhBOhA_1793606827
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e17d30a79so1267796f8f.3
        for <soc@lists.linux.dev>; Mon, 02 Nov 2026 00:07:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793606827; x=1794211627;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=txDZNnldTMQQD+iUaNISkBDV+/o31r6YdqxFAbl/nU8=;
        b=pUdupndjg+ejF2ZwY+DV+B1EgcKFg5B/bkrYd1YzE8S8wEEdHs8KCmcd9XMcB9qouO
         +5mLbLvLuIgYOCS+0lV1KBNUDFVl3E/xPS7u6ntQKzl2pkU1OVVh34Dp3+aKthJDncrj
         0GUcloyzO+cmzWzXNzz8GfTzKFtBpr08HH53E9vHWgfp8AY0FJohqfY/rCemXbFQh1JE
         VAx4TaB9KkKKQ7wrLyMuP8thsecuDkOJEgJC/jTtw4nbRzWLhyw+iqE5WbDTTSnGQlkg
         zse3fPrs+hq6sdebV2MI6zA0F977wMmqgJ1fgdGgUVKR9ZtIDBCEJ4Eg2ZCHy1ULbfav
         zkZA==
X-Gm-Message-State: AFq9FYJAcf3xtVZWAN69CCY1Z3tXXG34/T+TOPy5bw6IiYGJ3tcDSuwG
	0t4xQ7L4fT3XNZlf9JsTO2KoIifeA2LQcrYSltsQIGtF9rWI5ucj0oSSsR8ZOMNON8nkYs+2Y20
	C6k70VUwolKbnSV8R+s4AgCF2xYfddH3J7cj3v4caOnSR/vnW3HBkDQ==
X-Gm-Gg: AYBFou1w7YisNepnHtpnAxZlayUHNi1kA6737U5mDOC8h9jjMFMT2Hf9MnHizDDBRwG
	bxngIzqfK07L9a84KeZgQYtLx0VVyu1/Yr+x0uZIWYGttkx3y0BP5mFUfFlYUpD1CqNzeuiD/Yk
	nuHtL36uYC4lqTF6wKe8Ft31+bJ5a+YE/sX1koKVkmjOI0SIqHpx7UqF9V0fqVYObiB9rsH8SbD
	xNIuhaGTOYAMuiEjUCzgKkPJ0fq2CcEbieVCs0zpxh0t9R8Jrqu6/N10HLxvxh8A1rn6XU8RnDw
	m+FbUIFNI3Gt7LhTLYm+laE+Br2LhQyDVXH+tqcCReWN+/wvBpQVaHyaGL+DRDpbMWNjSY65yjb
	02UrnqZ2d9DTRJ024vxzh64Ye5pRFVXL0sOaoamlpg6Ca
X-Received: by 2002:a05:600c:4454:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4ac1794032cmr216288175e9.16.1793606826718;
        Mon, 02 Nov 2026 00:07:06 -0800 (PST)
X-Received: by 2002:a05:600c:4454:b0:4a5:1cf1:b7bd with SMTP id 5b1f17b1804b1-4ac1794032cmr216287515e9.16.1793606826151;
        Mon, 02 Nov 2026 00:07:06 -0800 (PST)
Received: from [192.168.0.9] ([47.64.112.102])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80f047bfsm325330095e9.3.2026.11.02.00.07.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 00:07:05 -0800 (PST)
Message-ID: <4cfd205e-1150-452b-97a6-862329c838b5@redhat.com>
Date: Mon, 2 Nov 2026 09:07:04 +0100
X-Mailing-List: soc@lists.linux.dev
List-Id: <soc.lists.linux.dev>
List-Post: <mailto:soc@lists.linux.dev>
List-Help: <mailto:soc+help@lists.linux.dev>
List-Subscribe: <mailto:soc+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:soc+unsubscribe@lists.linux.dev>
List-Owner: <mailto:soc+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests: vDSO: Fix header search list for
 vgetrandom-chacha.S
To: Arnd Bergmann <arnd@arndb.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: soc@lists.linux.dev, shuah <shuah@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20261030174323.370687-1-thuth@redhat.com>
 <256fea10-f0c9-411d-a6b6-a82cad357b57@app.fastmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <256fea10-f0c9-411d-a6b6-a82cad357b57@app.fastmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: BxI8z9S6ojzOf1NBlUQzQmECqL34fnKE1MFlBwxbUbo_1793606827
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30/10/2026 22.36, Arnd Bergmann wrote:
> On Fri, Oct 30, 2026, at 18:43, Thomas Huth wrote:
>> On aarch64, vgetrandom-chacha.S includes the assembler file from
>> arch/arm64/kernel/vdso/vgetrandom-chacha.S, and that includes
>> <asm/assembler.h> which in turn includes lots of system header files.
>> For this, we should make sure that the kernel headers of the
>> *current* kernel are in the search path of the compiler, otherwise
>> we end up including headers from /usr/include of the current distro
>> instead, and this is calling for trouble! Thus use $(KHDR_INCLUDES)
>> here to make sure that we are using the right header files.
>> (This issue has been found in a patch series that replaces __ASSEMBLY__
>> with __ASSEMBLER__ in the various kernel headers and finally stops
>> defining __ASSEMBLY__ in the kernel makefiles - when vgetrandom-chacha.S
>> now tries to include a header from /usr/include the compilation fails
>> since those headers still require __ASSEMBLY__ to fence away the C code)
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   See this link for the build failure:
>>   
>> https://lore.kernel.org/oe-kbuild-all/9e294bfd-4704-42a5-a704-f301f4afe042@app.fastmail.com/
> 
> Tested-by: Arnd Bergmann <arnd@arndb.de> # (build tested)
> 
> If you like, I can add this to the asm-generic tree to avoid the
> regression from your series, or Shuah can pick this up the normal
> way as a bugfix for kselftest.
It's maybe better to stick the patch close to my other patches to avoid that 
other people run into problems when bisecting later, so unless Shuah objects 
I'd prefer if you could pick it up, Arnd!

  Thanks,
   Thomas

